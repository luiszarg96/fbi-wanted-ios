//
//  WantedList.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import SwiftUI

struct WantedListView: View {
    
    @State var viewModel: WantedListViewModel
    
    init(viewModel: WantedListViewModel = WantedListViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        NavigationView(content: {
            ScrollView {
                VStack {
                    wantedPersonList
                }
            }
        })
        .searchable(text: .constant(""))
    }
    
    private var header: some View {
        HStack {
            Text("FBI Wanted List")
                .font(.title)
                .frame(alignment: .leading)
            
//            Image(systemName: "magnifyingglass")
        }
    }
    
    @ViewBuilder
    private var wantedPersonList: some View {
        
        VStack {
            ForEach(viewModel.wantedPersonList, id: \.self ) { item in
                PersonCard(
                    name: item.name,
                    personInfo: "",
                    imageUrl: item.avatarURL)
            }
        }
        .padding()
        .border(.black)
        .padding(.horizontal, 16)
        .background(.white)
        
    }
    
}

#Preview {
    WantedListView()
}
