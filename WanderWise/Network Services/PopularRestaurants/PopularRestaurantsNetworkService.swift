//
//  PopularRestaurantsNetworkService.swift
//  WanderWise
//
//  Created by Turan Çabuk on 31.07.2024.
//

import SwiftUI

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
}

protocol PopularRestaurantsNetworkServiceProtocol{
    func fetchRestaurantsDetails(restaurantId: Int, completion: @escaping (Result<PopularRestaurantsDetail, NetworkError>) -> Void)
}

class PopularRestaurantsNetworkService: PopularRestaurantsNetworkServiceProtocol {
    
    func fetchRestaurantsDetails(restaurantId: Int, completion: @escaping (Result<PopularRestaurantsDetail, NetworkError>) -> Void) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(restaurantId)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(.decodingError(error)))
                }
                
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                do{
                    let restaurantDetails = try JSONDecoder().decode(PopularRestaurantsDetail.self, from: data)
                    completion(.success(restaurantDetails))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }.resume()
    }
}


