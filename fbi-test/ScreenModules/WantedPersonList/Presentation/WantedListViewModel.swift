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
    @Published var wantedPersonList: [WantedPersonDomain] = []
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var showErrorMessage: Bool = false
    
    // MARK: - Private Properties
    private let wantedPersonUseCase: FBIWantedPersonUseCaseType
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializer
    init(
        wantedPersonUseCase: FBIWantedPersonUseCaseType = FBIWantedPersonUseCase()
    ) {
        self.wantedPersonUseCase = wantedPersonUseCase
    }
    
    // MARK: - Methods
    
    func setup() {
        fetchWantedPersonList()
    }
    
    func fetchWantedPersonList() {
        wantedPersonUseCase
            .fetchWantedPersonList()
            .receive(on: RunLoop.main)
            .handleEvents(receiveSubscription: { _ in
                self.isLoading = true
            })
            .sink { completion in
                self.isLoading = false
                guard case .failure = completion else { return }
                self.showAlert = true
                self.showErrorMessage = true
                
            } receiveValue: { [weak self] wantedListResponse in
                self?.wantedPersonList = wantedListResponse.toDomain()
                self?.showErrorMessage = false
            }
            .store(in: &cancellables)
    }
    
}

// MARK: - Localizable values
extension WantedListViewModel {
    
    var headerTitle: String {
        AppLocalized.headerTitle
    }
    
    var errorAlertTitle: String {
        AppLocalized.errorAlertTitle
    }
    
    var errorAlertMessage: String {
        AppLocalized.errorAlertMessage
    }

    var errorButton: String {
        AppLocalized.errorButton
    }
    
}

