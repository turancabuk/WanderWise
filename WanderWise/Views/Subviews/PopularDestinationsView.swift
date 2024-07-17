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
                        NavigationLink(destination: Text("Destination2")) {
                            VStack(alignment: .leading, spacing: 2){
                                Image(category.image)
                                    .resizable()
                                    .modifier(ImageModifier2())
                                Text(category.city)
                                    .modifier(TextModifier2())
                                    .foregroundColor(.black)
                                Text(category.country)
                                    .modifier(TextModifier2())
                                    .foregroundColor(.gray)
                            }
                            .modifier(VstackModifier())
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
}
#Preview {
    PopularDestinationsView()
}
