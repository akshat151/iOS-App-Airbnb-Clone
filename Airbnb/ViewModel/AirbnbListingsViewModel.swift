//
//  AirbnbListingsViewModel.swift
//  Airbnb
//
//  Created by Akshat Khare on 11/7/23.
//

import Foundation

public final class AirbnbListingsViewModel: ObservableObject{
    private let service = APIService()
    
    @Published var listings: [AirbnbListing] = []
    
    public func fetchListings(){
        service.getListings{[weak self] result in
            switch result {
            case .success(let models):
                self?.listings = models
            case .failure:
                break;
            }
        }
    }
     
}
