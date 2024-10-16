//
//  PersonCard.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import SwiftUI

struct PersonCard: View {
    
    var name: String
    var personInfo: String
    var imageUrl: String
    
    var body: some View {

        HStack {
            avatar
            info
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.top)
    }
    
    @ViewBuilder
    private var avatar: some View {
        AsyncImage(url: URL(string: imageUrl))
            .frame(width: 75, height: 75)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private var info: some View {
        
        VStack(alignment: .leading) {
            Text(name)
                .font(.title2)
            
            Text("Alias: Boris levitan, Boris")
                .font(.callout)
                .foregroundStyle(.gray)
            
            
            Text(personInfo)
            
            Button(action: {},
                   label: {
                Text("Show More")
            })

        }
        
    }
    
}

//#Preview {
//    PersonCard(
//        name: "Jesus de la criz",
//        personInfo: "Loren ipsum",
//        imageUrl: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb")
//}
