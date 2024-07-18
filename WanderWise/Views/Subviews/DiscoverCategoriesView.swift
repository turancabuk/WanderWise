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
        .init(name: "Sports", image: "sportscourt.fill"),
        .init(name: "Live Events", image: "music.mic"),
        .init(name: "Food", image: "fork.knife.circle.fill"),
        .init(name: "History", image: "books.vertical.fill"),
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 12){
                ForEach(categories, id: \.self) { category in
                    NavigationLink(destination: NavigationLazyView(DiscoverCategoriesDetailView(name: category.name))) {
                        VStack(spacing: 16) {
                            Image(systemName: category.image)
                                .modifier(ImageModifier())
                            Text(category.name)
                                .modifier(TextModifier())
                        }.frame(width: 68)

                    }
                }
            }.padding()
        }
    }
}
struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
#Preview {
    DiscoverCategoriesView()
    
}
