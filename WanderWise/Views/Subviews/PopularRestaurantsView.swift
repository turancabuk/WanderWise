//
//  PopularRestaurantsView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI


struct PopularRestaurantsView: View {
    
    let restaurants: [PopularRestaurants] = [
        .init(name: "Japan's Finest Tapas", image: "tapas"),
        .init(name: "Bar & Grill", image: "bar_grill"),
    ]
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
                NavigationLink(destination: Text("destination3")) {
                    HStack(spacing:8.0){
                        ForEach(restaurants, id: \.self) { restaurant in
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
                        .modifier(ForeachModifier())
                    }.padding(.horizontal)
                }
            }
        }
    }
}
#Preview {
    PopularRestaurantsView()
}
