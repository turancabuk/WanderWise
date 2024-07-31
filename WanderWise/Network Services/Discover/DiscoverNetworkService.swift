//
//  DiscoverNetworkService.swift
//  WanderWise
//
//  Created by Turan Çabuk on 31.07.2024.
//

import Foundation

protocol DiscoverNetworkServiceProtocol {
    func fetchCategoriesDetails(name: String, completion: @escaping (Result<[DiscoverCategoriesDetail], Error>) -> Void)
}

class DiscoverNetworkService: DiscoverNetworkServiceProtocol {
    
    func fetchCategoriesDetails(name: String, completion: @escaping (Result<[DiscoverCategoriesDetail], Error>) -> Void) {
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }
        
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
                
                do{
                    let categories = try JSONDecoder().decode([DiscoverCategoriesDetail].self, from: data)
                    completion(.success(categories))
                }catch let decodeError{
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
