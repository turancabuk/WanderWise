//
//  DiscoverCategoriesDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 17.07.2024.
//

import SwiftUI

struct DiscoverCategoriesDetailView: View {
    
    @ObservedObject var vm = DiscoverCategoriesDetailViewModel()
    
    
    var body: some View {
        ZStack{
            if vm.isLoading {
                VStack(spacing: 20){
                    ActivityIndicatorView()
                    Text("Loading")
                }
            }else{
                ScrollView{
                    ForEach(vm.places, id: \.self) { detail in
                        VStack(alignment: .leading){
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text("demo")
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }.modifier(TileModifier())
                            .padding()
                    }
                }.navigationBarTitle("Category", displayMode: .inline)
            }
        }
    }
}
#Preview {
    DiscoverCategoriesDetailView()
}
