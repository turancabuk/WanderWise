//
//  DiscoverCategoriesDetailViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 17.07.2024.
//

import SwiftUI

class DiscoverCategoriesDetailViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [DiscoverDetailModel]()
    @Published var discoverCategories: [DiscoverCategories] = []
    @Published var errorMessage = ""
    
    init(name: String) {
        self.fetchCategories()
        self.fetchCategoriesDetails(name: name)
    }
    
    func fetchCategories() {
        DispatchQueue.global().async {
            let categories = [
                DiscoverCategories(name: "Art", image: "paintpalette.fill"),
                DiscoverCategories(name: "Sports", image: "sportscourt.fill"),
                DiscoverCategories(name: "Live Events", image: "music.mic"),
                DiscoverCategories(name: "Food", image: "fork.knife.circle.fill"),
                DiscoverCategories(name: "History", image: "books.vertical.fill"),
            ]
            DispatchQueue.main.async {
                self.discoverCategories = categories
            }
        }
    }
    func fetchCategoriesDetails(name: String) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                guard let data = data else {return}
                
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Bad status \(statusCode)"
                    return
                }
                
                do{
                    self.places = try JSONDecoder().decode([DiscoverDetailModel].self, from: data)
                }catch{
                    print("Failed to decod JSON data", error.localizedDescription)
                }
                self.isLoading = false
                self.errorMessage = error?.localizedDescription ?? ""
            }
        }.resume()
    }
}
