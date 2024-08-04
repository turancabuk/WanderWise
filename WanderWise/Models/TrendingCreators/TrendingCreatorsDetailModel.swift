//
//  TrendingCreatorsDetailModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 2.08.2024.
//

import Foundation

struct UserInfo: Decodable, Hashable {
    let username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [PostDetail]
}

struct PostDetail: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}
