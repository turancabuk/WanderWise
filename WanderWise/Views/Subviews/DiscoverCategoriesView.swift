//
//  DiscoverCategoriesView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
    let categories: [DiscoverCategories] = [
        .init(name: "Art", image: "paintpalette.fill"),
        .init(name: "Sport", image: "sportscourt.fill"),
        .init(name: "Live Events", image: "music.mic"),
        .init(name: "Food", image: "fork.knife.circle.fill"),
        .init(name: "History", image: "books.vertical.fill"),
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 12){
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 16) {
                        Image(systemName: category.image)
                            .modifier(ImageModifier())
                        Text(category.name)
                            .modifier(TextModifier())
                    }.frame(width: 68)
                }
            }.padding()
        }
    }
}
#Preview {
    DiscoverCategoriesView()
}
