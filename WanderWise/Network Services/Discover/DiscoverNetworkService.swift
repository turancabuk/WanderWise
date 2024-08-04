//
//  DiscoverNetworkService.swift
//  WanderWise
//
//  Created by Turan Çabuk on 31.07.2024.
//

import Foundation

protocol DiscoverNetworkServiceProtocol {
    func fetchCategoriesDetails(name: String, completion: @escaping (Result<[DiscoverCategoriesDetail], NetworkError>) -> Void)
}

class DiscoverNetworkService: DiscoverNetworkServiceProtocol {
    
    func fetchCategoriesDetails(name: String, completion: @escaping (Result<[DiscoverCategoriesDetail], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(.decodingError(error)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                do{
                    let categories = try JSONDecoder().decode([DiscoverCategoriesDetail].self, from: data)
                    completion(.success(categories))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }.resume()
    }
}
