//
//  PopularDestinationsDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 18.07.2024.
//

import SwiftUI
import MapKit

struct PopularDestinationsDetailView: View {
    
    let destination: PopularDestinations
    @State var region: MKCoordinateRegion
    
    init(destination: PopularDestinations){
        self.destination = destination
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitudee),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    var body: some View {
        ScrollView{
            Image(destination.image)
                .resizable()
                .scaledToFill()
                .padding(.horizontal, 6)
            VStack(alignment: .leading){
                Text(destination.city)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                    .font(.system(size: 18, weight: .regular))
                HStack{
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                HStack{
                    Spacer()
                }
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.system(size: 14, weight: .medium))
                    .padding(.bottom)
                Text("Location")
                    .font(.system(size: 18, weight: .bold))
                Map(coordinateRegion: .constant(region))
                    .frame(height: 200)
            }.padding(.horizontal)
        }.navigationBarTitle(destination.city, displayMode: .inline)
            .padding(.top, 6)
    }
}
#Preview {
    PopularDestinationsDetailView(destination: PopularDestinations(country: "France", city: "Paris", image: "eiffel_tower", latitude: 35.67988, longitudee: 139.7695))
}
