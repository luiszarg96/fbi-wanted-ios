//
//  HTTPClient.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import Foundation

struct Endpoint {
    static let baseUrl: String = "https://api.fbi.gov/@wanted?pageSize=25&page=1&sort_on=modified&sort_order=desc"
}



//class HTTPClient {
//    
//    static func request<T: Codable>(url: String,
//                        onSuccess: @escaping () -> T ) {
//       
//        guard let url = URL(string: url) else return
//        
//        URLSession.shared.downloadTask(with: URLRequest(url: url))
//        
//    }
//    
//}
