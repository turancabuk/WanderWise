//
//  ContentView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 14.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView() {
                
                DiscoverCategoriesView()
                PopularDestinationsView()
                PopularRestaurantsView()
                TrendingCreatorsView()
                
            }.navigationTitle("Discover")
        }
    }
}

#Preview {
    ContentView()
}
struct DiscoverCategories: Hashable {
    let name, image: String
}
struct DiscoverCategoriesView: View {
    
    let categories: [DiscoverCategories] = [
        .init(name: "Art", image: "paintpalette.fill"),
        .init(name: "Sport", image: "sportscourt.fill"),
        .init(name: "Live Events", image: "music.mic"),
        .init(name: "Food", image: "fork.knife.circle.fill"),
        .init(name: "History", image: "books.vertical.fill"),
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 12){
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 16) {
                        Image(systemName: category.image)
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                            .frame(width: 68, height: 68)
                            .background(Color.white)
                            .tint(Color.white)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                    }.frame(width: 68)
                }
            }.padding()
        }
    }
}
struct PopularDestinations: Hashable{
    let country, city, image: String
}
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
                        .background(Color(.init(white: 0.9, alpha: 1)))
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2.0)
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }.padding(.bottom)
    }
}
struct PopularRestaurants: Hashable {
    let name, image: String
    
}
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
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:8.0){
                    ForEach(restaurants, id: \.self) { restaurant in
                        HStack(spacing: 8){
                            Image(restaurant.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipped()
                                .cornerRadius(5)
                                .padding(.vertical, 6)
                                .padding(.leading, 6)
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
                            .frame(width: 250)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            .background(Color(.init(white: 0.9, alpha: 1)))
                    }
                }.padding(.horizontal)
            }
        }.padding(.bottom)
    }
}
struct TrendingCreators: Hashable {
    let name, image: String
}
struct TrendingCreatorsView: View {
    
    let creators: [TrendingCreators] = [
        .init(name: "Amy Adams", image: "amy"),
        .init(name: "Bilyy Childs", image: "billy"),
        .init(name: "Sam Smith", image: "sam")
    ]
    var body: some View {
        VStack{
            HStack{
                Text("Trending creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8){
                    ForEach(creators, id: \.self) { creator in
                        VStack{
                            Image(creator.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .cornerRadius(.infinity)
                                .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            Text(creator.name)
                                .font(.system(size: 10, weight: .semibold))
                        }
                    }
                }.padding(.horizontal)
                    .padding(.bottom)
            }
        }
    }
}
