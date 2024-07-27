//
//  DiscoverCategoriesView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
    @ObservedObject var viewmodel: DiscoverCategoriesDetailViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 12){
                ForEach(viewmodel.discoverCategories, id: \.self) { category in
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
    DiscoverCategoriesView(viewmodel: DiscoverCategoriesDetailViewModel(name: ""))
    
}
