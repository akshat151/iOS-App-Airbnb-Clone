//
//  AirbnbListingsCardView.swift
//  Airbnb
//
//  Created by Akshat Khare on 11/7/23.
//

import SwiftUI

struct AirbnbListingsCardView: View {
    let model: AirbnbListing
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: model.thumbnail_url ?? ""))
                .frame(width:100, height: 100)
                .scaledToFit()
                .clipped()

            VStack{
                Text(model.name ?? "Listing").font(.title3).bold().lineLimit(1)
                
                Text(model.description ?? "Listing").lineLimit(3).foregroundColor((Color(.secondaryLabel))).font(.body)
            }
           
            
        }
    }
}

