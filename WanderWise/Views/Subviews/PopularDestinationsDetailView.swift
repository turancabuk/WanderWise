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
    @State var toggleIsOn = false
    
    init(destination: PopularDestinations){
        self.destination = destination
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitudee),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
    
    let attractions: [AttractionModel] = [
        .init(name: "Eiffel Tower", latitude: 48.859565, longitude: 2.353235),
        .init(name: "Champs-Elysees", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", latitude: 48.860288, longitude: 2.337789)
    ]
    
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
                HStack{
                    Text("Location")
                        .font(.system(size: 18, weight: .bold))
                    Spacer()
                    Button(action: {toggleIsOn.toggle()}, label: {
                        Text("\(toggleIsOn ? "Hide" : "Show") Attractions")
                    })
                    .font(.system(size: 14, weight: .bold))
                    Toggle("", isOn: $toggleIsOn)
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .bold))
                        .labelsHidden()
                }
                Map(coordinateRegion: $region, annotationItems: toggleIsOn ? attractions : []) { attraction in
                    MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude), tint: .blue)
                }
                    .frame(height: 300)
            }.padding(.horizontal)
        }.navigationBarTitle(destination.city, displayMode: .inline)
            .padding(.top, 6)
    }
}
#Preview {
    PopularDestinationsDetailView(destination: PopularDestinations(country: "France", city: "Paris", image: "eiffel_tower", latitude: 48.859565, longitudee: 2.353235))
}
