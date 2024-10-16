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
            progressView
        }
        .onAppear {
            viewModel.setup()
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
            Text(viewModel.headerTitle)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            Image(systemName: WantedListConstants.iconName)
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
    
    @ViewBuilder
    private var progressView: some View {
        if viewModel.isLoading {
            ProgressViewIndicator()
        }
    }
}

#Preview {
    WantedListView()
}
