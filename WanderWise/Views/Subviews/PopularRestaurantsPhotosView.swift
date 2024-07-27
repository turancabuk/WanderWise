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
    @State var mode = "list"
    


    var body: some View {
        Picker("picker", selection: $mode) {
            Text("Grid").tag("grid")
            Text("List").tag("list")
        }.pickerStyle(SegmentedPickerStyle())
            .padding()
        ScrollView{
            if mode == "grid" {
                let columns: [GridItem] = [
                    GridItem(.flexible(), spacing: 4, alignment: nil),
                    GridItem(.flexible(), spacing: 4, alignment: nil),
                    GridItem(.flexible(), spacing: 4, alignment: nil),
                ]
                
                LazyVGrid(columns: columns, content: {
                    ForEach(viewmodel.restaurantDetails?.photos ?? [], id: \.self) { restaurantPhotos in
                        KFImage(URL(string: restaurantPhotos))
                            .resizable()
                            .frame(height: 90)
                            .padding(.horizontal,4)
                    }
                })
                .padding()
            }else{
                let columns: [GridItem] = [
                    GridItem(.flexible(), spacing: 4, alignment: nil),
                ]
                LazyVGrid(columns: columns, content: {
                    ForEach(viewmodel.restaurantDetails?.photos ?? [], id: \.self) { restaurantPhotos in
                        KFImage(URL(string: restaurantPhotos))
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(8.0)
                            .padding(.horizontal,4)
                        VStack(alignment: .leading, spacing: 8) {
                            HStack{
                                Image(systemName: "heart")
                                Image(systemName: "bubble.right")
                                Image(systemName: "paperplane")
                                Spacer()
                                Image(systemName: "bookmark")
                            }.font(.system(size: 20))
                                .padding(.vertical, 2)
                                .padding(.horizontal)
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                                .font(.system(size: 16, weight: .regular))
                                .padding(.horizontal)
                            Text("posted on 10/07/2024")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            Spacer()
                        }.padding(.bottom)
                    }
                })
            }
        }.navigationBarTitle("Restaurant Photos", displayMode: .inline)
    }
}

#Preview {
    PopularRestaurantsPhotosView(viewmodel: PopularRestaurantsDetailViewModel())
}
