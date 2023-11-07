//
//  AirbnbListingResponse.swift
//  Airbnb
//
//  Created by Akshat Khare on 11/7/23.
//

import Foundation

struct AirbnbListingResponse: Codable{
    let totalCount: Int?
    let results: [AirbnbListing]
}
