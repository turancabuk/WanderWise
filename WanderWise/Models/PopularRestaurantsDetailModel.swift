//
//  PopularRestaurantsDetailModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 22.07.2024.
//

import Foundation

struct PopularRestaurantsDetailModel: Decodable, Hashable{
    let name, city, country, description, thumbnail: String
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
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let profileImage: String
    let followers: Int
    let following: Int
    let posts: [Post]
}

struct Post: Decodable, Hashable {
    let title: String
    let imageUrl: String
    let views: String
    let hashtags: [String]
}
