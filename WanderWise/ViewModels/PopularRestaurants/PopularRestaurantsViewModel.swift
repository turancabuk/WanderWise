//
//  PopularRestaurantsDetailViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 22.07.2024.
//

import SwiftUI

class PopularRestaurantsViewModel: ObservableObject {
    
    private var networkService: PopularRestaurantsNetworkServiceProtocol
    @Published var restaurants: [PopularRestaurants] = []
    @Published var restaurantDetails: PopularRestaurantsDetail?
    
    init(networkService: PopularRestaurantsNetworkServiceProtocol, restaurantId: Int) {
        self.networkService = networkService
        self.fetchRestaurantsDetails(restaurantId: restaurantId)
        self.fetchRestaurants()
    }
    
    func fetchRestaurants() {
        DispatchQueue.global().async {
            let restaurants = [
                PopularRestaurants(id: 0, name: "Japan's Finest Tapas", image: "tapas"),
                PopularRestaurants(id: 1, name: "Bar & Grill", image: "bar_grill")
            ]
            DispatchQueue.main.async {
                self.restaurants = restaurants
            }
        }
    }
    
    func fetchRestaurantsDetails(restaurantId: Int) {
        networkService.fetchRestaurantsDetails(restaurantId: restaurantId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let restaurantDetails):
                    self?.restaurantDetails = restaurantDetails
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}


