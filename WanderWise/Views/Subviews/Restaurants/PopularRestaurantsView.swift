//
//  PopularRestaurantsView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI

struct PopularRestaurantsView: View {
    
    @StateObject var viewmodel: PopularRestaurantsViewModel
    
    init() {
        let networkService = PopularRestaurantsNetworkService()
        _viewmodel = StateObject(wrappedValue: PopularRestaurantsViewModel(networkService: networkService, restaurantId: 0))
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Popular places to eat")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.black)
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:8.0){
                    ForEach(viewmodel.restaurants, id: \.self) { restaurant in
                        NavigationLink {
                            PopularRestaurantsDetailView(popularRestaurants: restaurant)
                        } label: {
                            RestaurantsView(restaurant: restaurant)
                        }
                    }
                    .modifier(ForeachModifier())
                }.padding(.horizontal)
            }
        }
    }
}
struct RestaurantsView: View {
    let restaurant: PopularRestaurants
    var body: some View {
        HStack(spacing: 8){
            Image(restaurant.image)
                .resizable()
                .modifier(ImageModifier3())
            VStack(alignment: .leading, spacing: 6){
                HStack{
                    Text(restaurant.name)
                        .font(.system(size: 12, weight: .semibold))
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    })
                }
                HStack{
                    Image(systemName: "star.fill")
                    Text("4.7 • Sushi • $$")
                }
                Text("Tokyo, Japan")
            }.font(.system(size: 12, weight: .semibold))
            Spacer()
        }
        .modifier(HstackModifier())
    }
}
#Preview {
    PopularRestaurantsView()
}

