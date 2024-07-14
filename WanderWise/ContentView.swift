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
struct Category: Hashable {
    let name, image: String
}
struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
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

struct PopularDestinationsView: View {
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
                    ForEach(0..<5, id: \.self) { num in
                        Spacer()
                            .frame(width: 125, height: 150)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2.0)
                    }
                }.padding(.horizontal)
            }
        }.padding(.bottom)
    }
}

struct PopularRestaurantsView: View {
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
                HStack(spacing: 8.0){
                    ForEach(0..<5, id: \.self) { num in
                        Spacer()
                            .frame(width: 250, height: 80)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    }
                }.padding(.horizontal)
            }
        }.padding(.bottom)
    }
}

struct TrendingCreatorsView: View {
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
                    ForEach(0..<5, id: \.self) { num in
                        Spacer()
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    }
                }.padding(.horizontal)
                    .padding(.bottom)
            }
        }
    }
}
