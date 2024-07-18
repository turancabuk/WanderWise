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
    
    init() {
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                guard let data = data else {return}
                do{
                    self.places = try JSONDecoder().decode([Places].self, from: data)
                }catch{
                    print("Failed to decod JSON data", error.localizedDescription)
                }
                self.isLoading = false
            }
        }.resume()
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    
}
