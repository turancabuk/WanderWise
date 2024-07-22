//
//  PopularRestaurantsDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 21.07.2024.
//

import SwiftUI

struct PopularRestaurantsDetailView: View {
    
    let restaurant: PopularRestaurants
    
    init(restaurant: PopularRestaurants) {
        self.restaurant = restaurant
    }
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.image)
                    .resizable()
                    .frame(height: 250)
                    .scaledToFit()
                LinearGradient(colors: [.clear, .primary], startPoint: .center, endPoint: .bottom)
                VStack(alignment: .leading, spacing: 6) {
                    Spacer()
                    Text(restaurant.name)
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundColor(.white)
                    HStack(spacing: 12) {
                        ForEach(0...4, id: \.self) { star in
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                                .frame(width: 12)
                        }
                    }
                }.padding()
            }
            VStack(alignment: .leading, spacing: 4){
                Text("Location & Description")
                    .font(.system(size: 18, weight: .bold))
                Text("Tokyo, Japan")
                    .font(.system(size: 16, weight: .medium))
                HStack{
                    ForEach(0...2, id: \.self) { _ in
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                            .font(.system(size: 18))
                    }
                }
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                Text("Popular Dishes")
                    .font(.system(size: 18, weight: .bold))
            }.padding(.horizontal, 12)
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(0...4, id: \.self) { _ in
                        VStack(alignment: .leading){
                            ZStack(alignment: .bottomLeading){
                                Image(restaurant.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                LinearGradient(colors: [.clear, .primary], startPoint: .center, endPoint: .bottom)
                                Text("4.99 $")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(4)
                            }
                            .shadow(color: .black, radius: 4)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 2)
                            Text("Dragon Roll")
                                .font(.system(size: 14, weight: .semibold))
                            Text("9 Photos")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                    }
                }.padding(.leading, 12)
            }.scrollIndicators(.hidden)
        }.navigationBarTitle("Restaurant Detail", displayMode: .inline)
            .padding(.bottom)
    }
}

#Preview {
    PopularRestaurantsDetailView(restaurant: PopularRestaurants(name: "Japan's Finest Tapas", image: "tapas"))
}

