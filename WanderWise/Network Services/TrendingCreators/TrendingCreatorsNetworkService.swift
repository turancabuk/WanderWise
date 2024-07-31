//
//  TrendingCreatorsNetworkService.swift
//  WanderWise
//
//  Created by Turan Çabuk on 31.07.2024.
//

import SwiftUI

protocol TrendingCreatorsNetworkServiceProtocol {
    func fetchCreatorsDetails(userId: Int, completion: @escaping (Result<UserInfo, NetworkError>) -> Void)
}
class TrendingCreatorsNetworkService: TrendingCreatorsNetworkServiceProtocol {
    func fetchCreatorsDetails(userId: Int, completion: @escaping (Result<UserInfo, NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userId)") else {
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
                    let users = try JSONDecoder().decode(UserInfo.self, from: data)
                    completion(.success(users))
                }catch{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

