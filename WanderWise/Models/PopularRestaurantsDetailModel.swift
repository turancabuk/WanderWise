//
//  PopularRestaurantsDetailModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 22.07.2024.
//

import Foundation

struct PopularRestaurantsDetailModel: Decodable, Hashable{
    let name, city, country, description, thumbnail: String
    let photos: [String]
    let popularDishes: [Dish]
    let reviews: [review]
}

struct Dish: Decodable, Hashable {
    let name, price, photo: String
    let numPhotos: Int
}

struct review: Decodable, Hashable {
    let user: User
    let rating: Int
    let text: String
}

struct User: Decodable, Hashable {
    let firstName, lastName, profileImage: String
}
