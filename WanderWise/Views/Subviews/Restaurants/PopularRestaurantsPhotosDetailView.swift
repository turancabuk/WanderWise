//
//  PopularRestaurantsPhotosDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 27.07.2024.
//

import SwiftUI
import Kingfisher

struct PopularRestaurantsPhotosDetailView: View {
    
    var viewmodel: PopularRestaurantsViewModel
    @State var selectedPhotoIndex: Int
    
    var body: some View {
        TabView(selection: $selectedPhotoIndex) {
            ForEach(Array((viewmodel.restaurantDetails?.photos ?? []).enumerated()), id: \.element) { index, photos in
            KFImage(URL(string: photos))
                    .resizable()
                    .scaledToFit()
                    .tag(index)
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    PopularRestaurantsPhotosDetailView(viewmodel: PopularRestaurantsViewModel(restaurantId: 0), selectedPhotoIndex: 0)
}
