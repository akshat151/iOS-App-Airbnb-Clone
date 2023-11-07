//
//  APIService.swift
//  Airbnb
//
//  Created by Akshat Khare on 11/7/23.
//

import Foundation

final class APIService{
    init(){
         
    }
    
    struct Constants{
        static let url = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=100&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22")
    }
    
    public func getListings(completion: @escaping (Result<[AirbnbListing], Error>) -> ()){
        guard let url = Constants.url else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in guard let data = data, error == nil else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            
            do{
                let response = try JSONDecoder().decode(AirbnbListingResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
     
}
