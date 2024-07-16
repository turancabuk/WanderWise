//
//  PopularDestinationsView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI


struct PopularDestinationsView: View {
    
    let categories: [PopularDestinations] = [
        .init(country: "France", city: "Paris", image: "eiffel_tower"),
        .init(country: "Japan", city: "Tokyo", image: "japan"),
        .init(country: "New York", city: "Seattle", image: "new_york"),
    ]
    var body: some View {
        VStack{
            HStack{
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
             .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0){
                    ForEach(categories, id: \.self) { category in
                        VStack(alignment: .leading, spacing: 2){
                            
                            Image(category.image)
                                .resizable()
                                .cornerRadius(6)
                                .padding(.top, 6)

                            Text(category.city)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 4)
                            Text(category.country)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 4)
                                .foregroundColor(.gray)
                        }.padding(.horizontal, 6)
                            .padding(.bottom, 6)
                        .frame(width: 125, height: 150)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2.0)
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    PopularDestinationsView()
}
