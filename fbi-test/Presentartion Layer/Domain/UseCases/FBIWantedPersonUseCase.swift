//
//  FBIWantedPersonUseCase.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-16.
//

import Foundation
import Combine

protocol FBIWantedPersonUseCaseType {
    func fetchWantedPersonList() -> AnyPublisher<WantedListResponse, Error>
}

struct FBIWantedPersonUseCase: FBIWantedPersonUseCaseType {
    
    // MARK: Properties
    let repository: FBIWantedPersonRepositoryType

    // MARK: Initializer
    init(
        repository: FBIWantedPersonRepositoryType = FBIWantedPersonRepository()
    ) {
        self.repository = repository
    }
    
    // MARK: Methods
    func fetchWantedPersonList() -> AnyPublisher<WantedListResponse, Error> {
        repository
            .fetchWantedPersonList()
    }
}
