//
//  MainView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 14.07.2024.
//

import SwiftUI

struct MainView: View {
    @State  var textfieldText: String = "" 
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9882131219, green: 0.6823856831, blue: 0.2509839535, alpha: 1)), Color(#colorLiteral(red: 0.996080339, green: 0.446325405, blue: 0.2697934847, alpha: 1))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y: 400)
                ScrollView(showsIndicators: false) {
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go")
                        Spacer()
                    }
                    .modifier(CustomModifier())
                    DiscoverCategoriesView(viewmodel: DiscoverCategoriesViewModel(networkService: DiscoverNetworkService()))
                    VStack{
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }
                    .modifier(CustomModifier1())
                }.navigationTitle("Discover")
            }
        }
    }
}
#Preview {
    MainView()
}


