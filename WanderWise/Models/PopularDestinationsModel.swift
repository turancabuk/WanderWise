//
//  PopularDestinationsModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import Foundation

struct PopularDestinations: Hashable{
    let country, city, image: String
    let latitude, longitudee: Double
}

struct AttractionModel: Identifiable {
    var id = UUID().uuidString
    let name, image: String
    let latitude, longitude: Double
}
