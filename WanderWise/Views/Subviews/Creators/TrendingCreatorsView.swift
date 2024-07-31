//
//  TrendingCreatorsView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI


struct TrendingCreatorsView: View {
    
    @ObservedObject var viewmodel = TrendingCreatorsViewModel(userId: 0)
    
    var body: some View {
        VStack{
            HStack{
                Text("Trending creators")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 8){
                    ForEach(viewmodel.popularCreators, id: \.self) { creator in
                        NavigationLink(destination: TrendingCreatorsDetailView(creator: creator)) {
                            VStack{
                                Image(creator.image)
                                    .resizable()
                                    .modifier(ImageModifier4())
                                Text(creator.name)
                                    .font(.system(size: 10, weight: .semibold))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .modifier(HstackModifier2())
            }
        }
    }
}
#Preview {
    TrendingCreatorsView()
}
