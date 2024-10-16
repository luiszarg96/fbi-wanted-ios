//
//  WantedListViewModel.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import Foundation
import Combine


class WantedListViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var wantedPersonList: [WanterPersonDomain] = [
        .init(name: "Marty Perez", avatarURL: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"),
        .init(name: "Luis Zarza", avatarURL: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"),
        .init(name: "Maria Gonzalez", avatarURL: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"),
        .init(name: "Jesus Robinson", avatarURL: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"),
    ]
    
    // MARK: - Private Properties
    
    // MARK: - Internal Properties
    
    // MARK: - Variables
    
    // MARK: - Initializer
    
    // MARK: - Methods
    
    func setup() {
        
    }
    
    func fetchData() {
        
    }
    
}

// MARK: - Localizable values
extension WantedListViewModel {
    
}

