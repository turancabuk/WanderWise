//
//  PopularRestaurantsNetworkService.swift
//  WanderWise
//
//  Created by Turan Çabuk on 31.07.2024.
//

import SwiftUI

protocol PopularRestaurantsNetworkServiceProtocol{
    func fetchRestaurantsDetails(restaurantId: Int, completion: @escaping (Result<PopularRestaurantsDetail, Error>) -> Void)
}

class PopularRestaurantsNetworkService: PopularRestaurantsNetworkServiceProtocol {
    
    func fetchRestaurantsDetails(restaurantId: Int, completion: @escaping (Result<PopularRestaurantsDetail, Error>) -> Void) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(restaurantId)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data", code: -1)))
                    return
                }
                
                do {
                    let restaurantDetails = try JSONDecoder().decode(PopularRestaurantsDetail.self, from: data)
                    completion(.success(restaurantDetails))
                } catch let decodeError{
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
