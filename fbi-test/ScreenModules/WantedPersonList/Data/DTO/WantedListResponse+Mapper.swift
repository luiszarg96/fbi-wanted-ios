//
//  WantedListResponse+Mapper.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-16.
//

import Foundation

extension WantedListResponse {
    func toDomain() -> [WantedPersonDomain] {
        items.map {
            let aliases = $0.aliases?.joined(separator: ", ") ?? ""
            
            return .init(
                title: $0.title ?? "",
                description: $0.description ?? "",
                aliases: aliases,
                avatarURL: $0.images?.first?.thumb ?? ""
            )
        }
    }
}
