//
//  HTTPClient.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import Foundation
import Combine

struct Endpoint {
    static let baseUrl: String = "https://api.fbi.gov/@wanted?pageSize=25&page=1&sort_on=modified&sort_order=desc"
}

enum ApiError: Error {
    case clientError
    case serverError
    case unknownError
    case errorInUrl
    case errorDecoding
}

enum HTTPResponseStatus {
    static let success = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}

extension ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .clientError:
            return NSLocalizedString("Client Error", comment: "")
        case .serverError:
            return NSLocalizedString("Server Error", comment: "")
        case .unknownError:
            return NSLocalizedString("Unkwon Error", comment: "")
        case .errorInUrl:
            return NSLocalizedString("Url Error", comment: "")
        case .errorDecoding:
            return NSLocalizedString("Decoding Error", comment: "")
        }
    }
}


class HTTPClient {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Codable>(url: URL?, type: T.Type) -> AnyPublisher<T, Error> {
        guard let url = url else {
            return Fail(error: ApiError.errorInUrl).eraseToAnyPublisher()
        }
        
        return makeRequest(url: url)
    }

    private func makeRequest<T: Codable>(url: URL) -> AnyPublisher<T, Error> {
        session.dataTaskPublisher(for: url)
            .tryMap { data, response in
                try self.validateResponse((data, response))
            }
            .eraseToAnyPublisher()
    }

    private func validateResponse<T: Codable>(_ request: (data: Data, response: URLResponse)) throws -> T {
        guard let httpResponse = request.response as? HTTPURLResponse else {
            throw ApiError.unknownError
        }

        switch httpResponse.statusCode {
        case HTTPResponseStatus.success:
            return try decodeModel(data: request.data)
        case HTTPResponseStatus.clientError:
            throw ApiError.clientError
        case HTTPResponseStatus.serverError:
            throw ApiError.serverError
        default:
            throw ApiError.unknownError
        }
    }

    private func decodeModel<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            print("Data corrupted: \(context.debugDescription)")
            throw ApiError.errorDecoding
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found: \(context.debugDescription)")
            throw ApiError.errorDecoding
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type mismatch for type '\(type)': \(context.debugDescription)")
            throw ApiError.errorDecoding
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found: \(context.debugDescription)")
            throw ApiError.errorDecoding
        } catch {
            print("Unknown error: \(error.localizedDescription)")
            throw ApiError.errorDecoding
        }
    }
}
