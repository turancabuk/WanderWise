//
//  TrendingCreatorsViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 27.07.2024.
//

import Foundation


class TrendingCreatorsViewModel: ObservableObject {

    private var networkService: TrendingCreatorsNetworkServiceProtocol
    @Published var popularCreators: [TrendingCreators] = []
    @Published var creatorsDetails: UserInfo?
    
    init(networkService: TrendingCreatorsNetworkServiceProtocol, userId: Int) {
        self.networkService = networkService
        self.creators()
        self.fetchCreatorsDetails(userId: userId)
    }
    
    func creators() {
        DispatchQueue.global().async {
            let creators = [
                TrendingCreators(id: 0, name: "Amy Adams", image: "amy"),
                TrendingCreators(id: 1, name: "Bilyy Childs", image: "billy"),
                TrendingCreators(id: 2, name: "Sam Smith", image: "sam")
            ]
            DispatchQueue.main.async {
                self.popularCreators = creators
            }
        }
    }
    
    func fetchCreatorsDetails(userId: Int) {
        networkService.fetchCreatorsDetails(userId: userId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.creatorsDetails = users
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
