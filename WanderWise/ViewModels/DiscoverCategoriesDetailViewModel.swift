//
//  DiscoverCategoriesDetailViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 17.07.2024.
//

import SwiftUI

class DiscoverCategoriesDetailViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Places]()
    @Published var errorMessage = ""
    
    init(name: String) {
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                self.isLoading = false
                self.errorMessage = "Bad status \(statusCode)"
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                guard let data = data else {return}
                do{
                    self.places = try JSONDecoder().decode([Places].self, from: data)
                }catch{
                    print("Failed to decod JSON data", error.localizedDescription)
                }
                self.isLoading = false
                self.errorMessage = error?.localizedDescription ?? ""
            }
        }.resume()
    }
}
