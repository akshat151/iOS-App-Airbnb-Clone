//
//  AirbnbDetailView.swift
//  Airbnb
//
//  Created by Akshat Khare on 11/7/23.
//

import SwiftUI

struct AirbnbDetailView: View {
    let model: AirbnbListing
    var body: some View {
        VStack{
            ScrollView(.vertical){
                //Picture
                AsyncImage(url: URL(string: model.xl_picture_url ?? "")) .frame(width: 400, height: 400).aspectRatio(contentMode: ContentMode.fit).clipped().padding()
                //Info
                Text(model.name ?? "").bold().padding()
                if let price = model.price {
                    Text("Rate: \(price.formatted(.currency(code: "USD")))")
                }
                Text("Description: \(model.description ?? "")").padding()
                Text("Summary: \(model.summary ?? "")").padding()
                Text("House Rules: \(model.house_rules ?? "")").padding()
                Text("Space: \(model.space ?? "")").padding()
                Text("Amenities: \(model.amenities!.joined(separator: ", ") )").padding()
                //Host Info
                Text("Know Your Host").font(.title2).bold()
                HStack{
                    AsyncImage(url: URL(string: model.host_thumbnail_url ?? ""))
                        .frame(width: 75, height: 75)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle()).padding()
                    
                    Text("Hosting Since: "+(model.host_since ?? ""))
                        
                }.padding()
                
            }
        }.navigationTitle(model.name ?? "Listing")
        
    }
}

