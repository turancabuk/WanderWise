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
    var attractions: [AttractionModel] = []
    @State var region: MKCoordinateRegion
    @State var toggleIsOn = false
    
    init(destination: PopularDestinations){
        self.destination = destination
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitudee),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        switch destination.city {
        case "Paris":
            self.attractions = [
                .init(name: "Eiffel Tower", image: "eiffel_tower", latitude: 48.859565, longitude: 2.353235),
                .init(name: "Champs-Elysees", image: "Champs-Elysees", latitude: 48.866867, longitude: 2.311780),
                .init(name: "Louvre Museum", image: "Louvre Museum", latitude: 48.860288, longitude: 2.337789)
            ]
        case "Tokyo":
            self.attractions = [
                .init(name: "Tokyo Tower", image: "tokyo_tower", latitude: 35.6586, longitude: 139.7454),
                .init(name: "Sensoji Temple", image: "sensoji", latitude: 35.7148, longitude: 139.7967),
                .init(name: "Shibuya Crossing", image: "shibuya_crossing", latitude: 35.6595, longitude: 139.7005)
            ]
        case "New York":
            self.attractions = [
                .init(name: "Statue of Liberty", image: "statue_of_liberty", latitude: 40.6892, longitude: -74.0445),
                .init(name: "Times Square", image: "times_square", latitude: 40.7580, longitude: -73.9855),
                .init(name: "Central Park", image: "central_park", latitude: 40.7851, longitude: -73.9683)
            ]
        default:
            break
        }
    }
    
    
    var body: some View {
        ScrollView{
            TabView{
                ForEach(destination.image, id: \.self) { destinationPic in
                    Image(destinationPic)
                        .resizable()
                        .scaledToFill()
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 250)
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
                    MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                        AttractionView(attraction: attraction)
                    }
                }                
                .frame(height: 300)
            }.padding(.horizontal)
        }.navigationBarTitle(destination.city, displayMode: .inline)
            .padding(.top, 6)
    }
}
struct AttractionView: View {
    
    let attraction: AttractionModel
    
    var body: some View {
        VStack{
            Image(attraction.image)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(.infinity)
                .scaledToFill()
            
            Text(attraction.name)
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(
                    colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
        }
        .shadow(color: .black, radius: 5)
    }
}
#Preview {
    
    PopularDestinationsDetailView(destination: PopularDestinations(country: "France", city: "Paris", image: ["eiffel_tower", "japan", "new_york"], latitude: 48.859565, longitudee: 2.353235))
}
