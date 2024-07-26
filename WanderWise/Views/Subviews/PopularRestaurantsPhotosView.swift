//
//  PopularRestaurantsPhotosView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 25.07.2024.
//

import SwiftUI
import Kingfisher

struct PopularRestaurantsPhotosView: View {
    
    var viewmodel: PopularRestaurantsDetailViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 4, alignment: nil),
        GridItem(.flexible(), spacing: 4, alignment: nil),
        GridItem(.flexible(), spacing: 4, alignment: nil),
    ]

    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, content: {
                ForEach(viewmodel.restaurantDetails?.photos ?? [], id: \.self) { restaurantPhotos in
                    KFImage(URL(string: restaurantPhotos))
                        .resizable()
                        .frame(height: 90)
                        .padding(.horizontal,4)
                }
            })
            .padding()
        }.navigationBarTitle("Restaurant Photos", displayMode: .inline)
    }
}

#Preview {
    PopularRestaurantsPhotosView(viewmodel: PopularRestaurantsDetailViewModel())
}
