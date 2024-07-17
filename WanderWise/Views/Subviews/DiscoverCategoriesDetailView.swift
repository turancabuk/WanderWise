//
//  DiscoverCategoriesDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 17.07.2024.
//

import SwiftUI

struct DiscoverCategoriesDetailView: View {
    
    let discoverDetail: [DiscoverDetailModel] = [
        .init(name: "Painter Shop", image: "art1"),
        .init(name: "Museum", image: "art2")
    ]
    var body: some View {
        ScrollView{
            ForEach(discoverDetail, id: \.self) { detail in
                VStack(alignment: .leading){
                    Image(detail.image)
                        .resizable()
                        .scaledToFill()
                    Text(detail.name)
                        .font(.system(size: 12, weight: .semibold))
                        .padding()
                }.modifier(TileModifier())
                    .padding()
            }
        }.navigationBarTitle("Category", displayMode: .inline)
    }
}

#Preview {
    DiscoverCategoriesDetailView()
}
