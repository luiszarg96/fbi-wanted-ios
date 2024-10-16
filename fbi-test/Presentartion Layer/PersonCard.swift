//
//  PersonCard.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import SwiftUI

struct PersonCard: View {
    
    // MARK: Properties
    var name: String
    var personInfo: String
    var imageUrl: String
    
    // MARK: Body
    var body: some View {
        HStack(alignment: .top) {
            avatar
            info
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    @ViewBuilder
    private var avatar: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .frame(width: 90, height: 90)
                .aspectRatio(contentMode: .fit)
         } placeholder: {
            Circle()
                .foregroundColor(.secondary)
        }
    }
    
    @ViewBuilder
    private var info: some View {
        
        VStack(alignment: .leading) {
            Text(name)
            
            Text("Alias: Boris levitan, Boris")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
                .foregroundStyle(.gray)
            
            Text(personInfo)
            
            Button(action: {},
                   label: {
                Text("Show More")
            })
        }
    }
    
}

#Preview {
    PersonCard(
        name: "Jesus de la criz",
        personInfo: "Loren ipsum",
        imageUrl: "https://www.fbi.gov/wanted/vicap/missing-persons/jesus-de-la-cruz---lynn-massachusetts/@@images/image/thumb"
    )
}
