//
//  DiscoverCategoriesDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 17.07.2024.
//

import SwiftUI
import Kingfisher

struct DiscoverCategoriesDetailView: View {
    
    @ObservedObject var viewmodel: DiscoverCategoriesViewModel
    private let name: String
    
    init(name: String) {
        self.name = name
        self.viewmodel = DiscoverCategoriesViewModel(networkService: DiscoverNetworkService())
        self.viewmodel.fetchCategoriesDetails(name: name)
    }
    var body: some View {
        ZStack{
            if viewmodel.isLoading {
                VStack(spacing: 20){
                    ActivityIndicatorView()
                    Text("Loading")
                }
            }else{
                ZStack{
                    if !viewmodel.errorMessage.isEmpty {
                        VStack(spacing: 20){
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(viewmodel.errorMessage)
                                .font(.system(size: 16, weight: .semibold))
                        }
                    }
                }
                ScrollView{
                    ForEach(viewmodel.places, id: \.self) { place in
                        VStack(alignment: .leading){
                            KFImage(URL(string: place.thumbnail))
                                .resizable()
                                .scaledToFill()
                            Text(place.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }.modifier(TileModifier())
                            .padding()
                    }
                }.navigationBarTitle(name, displayMode: .inline)
            }
        }
    }
}
#Preview {
    DiscoverCategoriesDetailView(name: "")
}

