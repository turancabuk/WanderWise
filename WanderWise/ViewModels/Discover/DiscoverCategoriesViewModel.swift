//
//  DiscoverCategoriesViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 17.07.2024.
//

import SwiftUI

class DiscoverCategoriesViewModel: ObservableObject {
    
    private var networkService: DiscoverNetworkServiceProtocol
    @Published var places: [DiscoverCategoriesDetail] = []
    @Published var discoverCategories: [DiscoverCategories] = []
    @Published var isLoading = true
    @Published var errorMessage = ""
    
    init(networkService: DiscoverNetworkServiceProtocol) {
        self.networkService = networkService
        self.loadCategories()
    }
    
    func loadCategories() {
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
        self.isLoading = true
        self.errorMessage = ""
        
        networkService.fetchCategoriesDetails(name: name) { [weak self] result in
            switch result {
            case .success(let categories):
                self?.places = categories
                self?.isLoading = false
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
}
