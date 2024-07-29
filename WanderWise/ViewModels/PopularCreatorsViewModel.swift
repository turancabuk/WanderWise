//
//  PopularCreators.swift
//  WanderWise
//
//  Created by Turan Çabuk on 27.07.2024.
//

import Foundation


class PopularCreatorsViewModel: ObservableObject {

    @Published var popularCreators: [TrendingCreators] = []
    
    init() {
        self.fetchCreators()
    }
    func fetchCreators() {
        DispatchQueue.global().async {
            let creators = [
                TrendingCreators(name: "Amy Adams", image: "amy"),
                TrendingCreators(name: "Bilyy Childs", image: "billy"),
                TrendingCreators(name: "Sam Smith", image: "sam")
            ]
            DispatchQueue.main.async {
                self.popularCreators = creators
            }
        }
    }
}
