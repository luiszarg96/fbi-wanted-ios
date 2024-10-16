//
//  WantedListResponse+Mapper.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-16.
//

import Foundation

extension WantedListResponse {
    func toDomain() -> [WanterPersonDomain] {
        items.map {
            .init(
                title: $0.title ?? "",
                avatarURL: $0.images?.first?.thumb ?? ""
            )
        }
    }
}
