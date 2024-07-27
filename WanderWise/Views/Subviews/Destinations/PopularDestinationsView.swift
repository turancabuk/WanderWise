//
//  PopularDestinationsView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI


struct PopularDestinationsView: View {
    
    @ObservedObject var viewModel = PopularDestinationsViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.cityDestinations, id: \.self) { destination in
                        NavigationLink(destination: PopularDestinationsDetailView(viewModel: viewModel, destination: destination)) {
                            PopularDestinationsRow(destination: destination)
                        }
                    }
                }.padding(12)
            }
            .onAppear {
                viewModel.fetchDestinations()
            }
        }
    }
}
struct PopularDestinationsRow: View {
    
    let destination: PopularDestinations
    
    var body: some View {
        VStack(alignment: .leading){
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
