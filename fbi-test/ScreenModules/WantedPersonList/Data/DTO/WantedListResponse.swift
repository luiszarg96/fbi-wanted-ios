//
//  WantedListResponse.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import Foundation

struct WantedListResponse: Codable {
    let total: Int
    let items: [WantedPerson]
    let page: Int
}

// MARK: - Response
struct WantedPerson: Codable {
    let description: String?
    let aliases: [String]?
    let title: String?
    let images: [ImageResponse]?

    enum CodingKeys: String, CodingKey {
        case description
        case aliases
        case title
        case images
    }
}

// MARK: - Image
struct ImageResponse: Codable {
    let caption: String?
    let large: String?
    let original: String?
    let thumb: String?
}
