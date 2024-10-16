//
//  WantedListViewModel.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import Foundation
import Combine


final class WantedListViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var wantedPersonList: [WanterPersonDomain] = [
        .init(title: "Marty Perez", avatarURL: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"),
        .init(title: "Luis Zarza", avatarURL: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"),
        .init(title: "Maria Gonzalez", avatarURL: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"),
        .init(title: "Jesus Robinson", avatarURL: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"),
    ]
    
    // MARK: - Private Properties
    private let wantedPersonUseCase: FBIWantedPersonUseCaseType
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Internal Properties
    
    // MARK: - Variables
    
    // MARK: - Initializer
    init(
        wantedPersonUseCase: FBIWantedPersonUseCaseType = FBIWantedPersonUseCase()
    ) {
        self.wantedPersonUseCase = wantedPersonUseCase
        
        setup()
    }
    
    // MARK: - Methods
    
    func setup() {
        fetchWantedPersonList()
    }
    
    func fetchWantedPersonList() {
        wantedPersonUseCase
            .fetchWantedPersonList()
            .receive(on: RunLoop.main)
            .sink { completion in
                guard case .failure = completion else { return }
                
            } receiveValue: { [weak self] wantedListResponse in
                self?.wantedPersonList = wantedListResponse.toDomain()
            }
            .store(in: &cancellables)
    }
    
}

// MARK: - Localizable values
extension WantedListViewModel {
    
}

