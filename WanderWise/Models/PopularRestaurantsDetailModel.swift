//
//  PopularRestaurantsDetailModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 22.07.2024.
//

import Foundation

struct PopularRestaurantsDetailModel: Decodable, Hashable{
    let id: UUID
    let name, city, country, category, description, thumbnail: String
    let photos, popularDishes, reviews: [String]
    
}
