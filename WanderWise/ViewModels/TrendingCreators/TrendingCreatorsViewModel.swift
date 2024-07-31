//
//  TrendingCreatorsViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 27.07.2024.
//

import Foundation


class TrendingCreatorsViewModel: ObservableObject {

    @Published var popularCreators: [TrendingCreators] = []
    @Published var creatorsDetails: UserInfo?
    
    init(userId: Int) {
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
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userId)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            do{
                let details = try JSONDecoder().decode(UserInfo.self, from: data)
                DispatchQueue.main.async {
                    self.creatorsDetails = details
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
