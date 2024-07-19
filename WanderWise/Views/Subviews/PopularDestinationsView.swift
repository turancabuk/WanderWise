//
//  PopularDestinationsView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI


struct PopularDestinationsView: View {
    
    let destinations: [PopularDestinations] = [
        .init(country: "France", city: "Paris", image: "eiffel_tower"),
        .init(country: "Japan", city: "Tokyo", image: "japan"),
        .init(country: "New York", city: "Seattle", image: "new_york"),
    ]
    var body: some View {
        VStack{
            HStack{
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0){
                    ForEach(destinations, id: \.self) { destination in
                        NavigationLink(destination: PopularDestinationsDetailView(destination: destination)) {
                            PopularDestinationsRow(destination: destination)
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
}
struct PopularDestinationsRow: View {
    
    let destination: PopularDestinations
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            Image(destination.image)
                .resizable()
                .modifier(ImageModifier2())
            Text(destination.city)
                .modifier(TextModifier2())
                .foregroundColor(.black)
            Text(destination.country)
                .modifier(TextModifier2())
                .foregroundColor(.gray)
        }
        .modifier(VstackModifier())
    }
}
#Preview {
    PopularDestinationsView()
}
