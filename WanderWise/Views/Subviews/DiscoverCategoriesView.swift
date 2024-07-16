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
                            .font(.system(size: 24))
                            .foregroundColor(Color(.orange))
                            .frame(width: 68, height: 68)
                            .background(Color.white)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }.frame(width: 68)
                }
            }.padding()
        }
    }
}

#Preview {
    DiscoverCategoriesView()
}
