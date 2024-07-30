//
//  PopularRestaurantsModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import Foundation

struct PopularRestaurants: Hashable {
    let id: Int
    let name, image: String
}

struct PopularDestinations: Decodable, Hashable{
    let country, city: String
    let image: [String]
    let latitude, longitudee: Double
}

struct AttractionModel: Identifiable {
    var id = UUID().uuidString
    let name, image: String
    let latitude, longitude: Double
}
