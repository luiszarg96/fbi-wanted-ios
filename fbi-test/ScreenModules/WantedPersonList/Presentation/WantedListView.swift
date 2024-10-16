//
//  WantedList.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import SwiftUI

struct WantedListView: View {
    
    // MARK: Wrapped Properties
    @StateObject private var viewModel: WantedListViewModel
    
    // MARK: Initializer
    init(
        viewModel: WantedListViewModel = WantedListViewModel()
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    var body: some View {
        ZStack {
            content
            
            if viewModel.isLoading {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
        }
    }
    
    private var content: some View {
        NavigationStack {
            VStack {
                header
                
                wantedPersonList
            }
        }
    }
    
    private var header: some View {
        HStack(alignment: .center) {
            Text("FBI Wanted List")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.blue)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var wantedPersonList: some View {
        List {
            ForEach(viewModel.wantedPersonList, id: \.self ) { item in
                NavigationLink(value: item) {
                    WantedPersonCardView(
                        title: item.title,
                        aliases: item.aliases,
                        description: item.description,
                        imageUrl: item.avatarURL)
                }
            }
        }
    }
    
}

#Preview {
    WantedListView()
}
