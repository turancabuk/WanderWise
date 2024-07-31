//
//  PopularDestinationsDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 18.07.2024.
//

import SwiftUI
import MapKit

struct PopularDestinationsDetailView: View {
    
    @ObservedObject var viewModel: PopularDestinationsViewModel
    let destination: PopularDestinations
    
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
                    Button(action: { viewModel.toggleIsOn.toggle() }, label: {
                        Text("\(viewModel.toggleIsOn ? "Hide" : "Show") Attractions")
                    })
                    .font(.system(size: 14, weight: .bold))
                    Toggle("", isOn: $viewModel.toggleIsOn)
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .bold))
                        .labelsHidden()
                }
                Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.toggleIsOn ? viewModel.attractions : []) { attraction in
                    MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                        AttractionView(attraction: attraction)
                    }
                }
                .frame(height: 300)
            }.padding(.horizontal)
        }.navigationBarTitle(viewModel.selectedDestination?.city ?? "", displayMode: .inline)
            .padding(.top, 6)
            .onAppear {
                viewModel.selectDestination(destination)
            }
    }
}
struct AttractionView: View {
    
    let attraction: PopularRestaurantsAttractionModel
    
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
    let viewModel = PopularDestinationsViewModel()
    let sampleDestination = PopularDestinations(
        country: "France",
        city: "Paris",
        image: ["eiffel_tower", "paris2", "paris3"],
        latitude: 48.855014,
        longitudee: 2.341231
    )
    viewModel.selectDestination(sampleDestination)
    
    return PopularDestinationsDetailView(viewModel: viewModel, destination: sampleDestination)
}
