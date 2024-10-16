//
//  WantedPersonCardView.swift
//  fbi-test
//
//  Created by Luis Zarza on 2024-10-15.
//

import SwiftUI

struct WantedPersonCardView: View {
    
    // MARK: Wrapped Properties
    @State private var maxLines: Int? = 2
    @State private var hasMoreDescription = false
    
    // MARK: Properties
    var title: String
    var aliases: String
    var description: String
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
        ImageView(url: imageUrl)
    }
    
    @ViewBuilder
    private var info: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .bold()
            
            if !aliases.isEmpty {
                Text(aliases)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                    .foregroundStyle(.gray)
            }
            
            Text(description)
                .lineLimit(maxLines)
                .background {
                    GeometryReader { outer in
                        Text(description)
                            .fixedSize(horizontal: false, vertical: true)
                            .overlay {
                                GeometryReader { proxy in
                                    Color.clear
                                        .onAppear {
                                            hasMoreDescription = proxy.size.height > outer.size.height
                                        }
                                }
                            }
                            .hidden()
                    }
                }
            
            if hasMoreDescription {
                Text(getButtonText())
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        withAnimation {
                            maxLines = maxLines == 2 ? nil : 2
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func getButtonText() -> String{
        maxLines == 2 ? showMoreButton : showLessButton
    }
    
}

// MARK: Localizables
extension WantedPersonCardView {
    var showMoreButton: String {
        AppLocalized.showMore
    }

    var showLessButton: String {
        AppLocalized.showLess
    }
}

#Preview {
    WantedPersonCardView(
        title: "BORIS YAKOVLEVICH LIVSHITS",
        aliases: "MJ, JB, NC",
        description: " Conspiracy to Defraud the United States; Conspiracy to Violate the International Emergency Economic Powers Act (IEEPA); Bank Fraud Conspiracy; Wire Fraud Conspiracy; Wire Fraud; Money Laundering Conspiracy; Money Laundering; Conspiracy to Violate the Export Control Reform Act (ECRA); Smuggling Goods from the United States; Failure to File Electronic Export Information ",
        imageUrl: "https://www.fbi.gov/wanted/counterintelligence/boris-yakovlevich-livshits/@@images/image/thumb"
    )
    .previewLayout(.sizeThatFits)
}
