//
//  TrendingCreatorsModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import Foundation

struct TrendingCreators: Hashable {
    let id: Int
    let name, image: String
}

struct UserInfo: Decodable, Hashable {
    let username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [PostDetail]
}

struct PostDetail: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}
