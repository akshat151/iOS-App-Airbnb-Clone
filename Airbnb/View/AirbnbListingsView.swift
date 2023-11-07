//
//  AirbnbListingsView.swift
//  Airbnb
//
//  Created by Akshat Khare on 11/7/23.
//

import SwiftUI

struct AirbnbListingsView: View {
    @StateObject var viewModel = AirbnbListingsViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if viewModel.listings.isEmpty{
                    ProgressView("Loading").progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.listings) {
                        listing in NavigationLink(destination: AirbnbDetailView(model:listing), label: {
                            AirbnbListingsCardView(model: listing)
                        })
                    }.navigationTitle("AirBnb Clone")
                }
            }
           

        }.onAppear{
            viewModel.fetchListings()
        }
    }
}

struct AirbnbListingsView_Previews: PreviewProvider {
    static var previews: some View {
        AirbnbListingsView()
    }
}
