//
//  PopularRestaurantsDetailViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 22.07.2024.
//

import SwiftUI

class PopularRestaurantsDetailViewModel: ObservableObject {
    
    @Published var restaurantDetails: PopularRestaurantsDetailModel?

    init() {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0") else {return}
        
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
