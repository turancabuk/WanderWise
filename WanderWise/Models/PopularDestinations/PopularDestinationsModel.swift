//
//  PopularDestinations.swift
//  WanderWise
//
//  Created by Turan Çabuk on 31.07.2024.
//

import Foundation

struct PopularDestinations: Decodable, Hashable{
    let country, city: String
    let image: [String]
    let latitude, longitudee: Double
}
