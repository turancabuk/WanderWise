//
//  PopularRestaurantsAttractionsModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 31.07.2024.
//

import Foundation

struct PopularRestaurantsAttractionModel: Identifiable {
    var id = UUID().uuidString
    let name, image: String
    let latitude, longitude: Double
}
