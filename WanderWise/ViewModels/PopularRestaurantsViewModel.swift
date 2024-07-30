//
//  PopularRestaurantsDetailViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 22.07.2024.
//

import SwiftUI

class PopularRestaurantsViewModel: ObservableObject {
    
    @Published var restaurants: [PopularRestaurants] = []
    @Published var restaurantDetails: PopularRestaurantsDetailModel?
    
    init(restaurantId: Int) {
        self.fetchRestaurants()
        self.fetchRestaurantsDetails(restaurantId: restaurantId)
    }
    
    func fetchRestaurants() {
        DispatchQueue.global().async {
            let restarants = [
                PopularRestaurants(id: 0, name: "Japan's Finest Tapas", image: "tapas"),
                PopularRestaurants(id: 1, name: "Bar & Grill", image: "bar_grill")
            ]
            DispatchQueue.main.async {
                self.restaurants = restarants
            }
        }
    }
    func fetchRestaurantsDetails(restaurantId: Int) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(restaurantId)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    print("No data returned")
                    return
                }
                do {
                    self.restaurantDetails = try JSONDecoder().decode(PopularRestaurantsDetailModel.self, from: data)
                } catch {
                    print("Decoding error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}


