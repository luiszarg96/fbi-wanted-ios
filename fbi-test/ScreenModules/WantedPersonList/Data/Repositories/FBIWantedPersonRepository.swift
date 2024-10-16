//
//  FBIWantedPersonRepository.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-16.
//

import Foundation
import Combine

protocol FBIWantedPersonRepositoryType {
    func fetchWantedPersonList() -> AnyPublisher<WantedListResponse, Error>
}

struct FBIWantedPersonRepository: FBIWantedPersonRepositoryType {
    
    let networkRequester: HTTPClient
    let urlList: String
    
    // MARK: Initializer
    init(
        apiClientService: HTTPClient = HTTPClient(),
        urlList: String = Endpoint.baseUrl
    ) {
        self.networkRequester = apiClientService
        self.urlList = urlList
    }
    
    func fetchWantedPersonList() -> AnyPublisher<WantedListResponse, Error> {
        let url = URL(string: urlList)
        
        return networkRequester
            .request(url: url, type: WantedListResponse.self)
    }
    
}
