//
//  PopularDestinationsView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI


struct PopularDestinationsView: View {
    
    let cityDestinations: [PopularDestinations] = [
        .init(country: "France", city: "Paris", image: ["eiffel_tower", "paris2", "paris3"], latitude: 48.855014, longitudee: 2.341231),
        .init(country: "Japan", city: "Tokyo", image: ["japan", "tokyo2","tokyo3"], latitude: 35.67988, longitudee: 139.7695),
        .init(country: "United States", city: "New York", image: ["new_york", "new_york2", "new_york3"], latitude: 40.71592, longitudee: -74.0055),
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
                    ForEach(cityDestinations, id: \.self) { destination in
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
            Image(destination.image.first!)
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
