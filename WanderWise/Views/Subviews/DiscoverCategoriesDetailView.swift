//
//  DiscoverCategoriesDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 17.07.2024.
//

import SwiftUI
import Kingfisher

struct DiscoverCategoriesDetailView: View {
    
    @ObservedObject var vm: DiscoverCategoriesDetailViewModel
    private let name: String
    
    init(name: String) {
        self.name = name
        self.vm = .init(name: name)
    }
    var body: some View {
        ZStack{
            if vm.isLoading {
                VStack(spacing: 20){
                    ActivityIndicatorView()
                    Text("Loading")
                }
            }else{
                ZStack{
                    if !vm.errorMessage.isEmpty {
                        VStack(spacing: 20){
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(vm.errorMessage)
                                .font(.system(size: 16, weight: .semibold))
                        }
                    }
                }
                ScrollView{
                    ForEach(vm.places, id: \.self) { place in
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

