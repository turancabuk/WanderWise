//
//  DiscoverCategoriesView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
    @ObservedObject var viewmodel: DiscoverCategoriesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 12){
                ForEach(viewmodel.discoverCategories, id: \.self) { category in
                    NavigationLink(destination: DiscoverCategoriesDetailView(name: category.name)) {
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
#Preview {
    DiscoverCategoriesView(viewmodel: DiscoverCategoriesViewModel(networkService: DiscoverNetworkService()))
    
}
