//
//  ProgressViewIndicator.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-16.
//

import Foundation
import SwiftUI

struct ProgressViewIndicator: View {
    
    // MARK: Body
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView(loading)
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}

// MARK: Localizables
extension ProgressViewIndicator {
    var loading: String {
        AppLocalized.loading
    }
}
