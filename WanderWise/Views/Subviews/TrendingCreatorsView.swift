//
//  TrendingCreatorsView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI


struct TrendingCreatorsView: View {
    
    let creators: [TrendingCreators] = [
        .init(name: "Amy Adams", image: "amy"),
        .init(name: "Bilyy Childs", image: "billy"),
        .init(name: "Sam Smith", image: "sam")
    ]
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
                NavigationLink(destination: Text("destination4")) {
                    HStack(spacing: 8){
                        ForEach(creators, id: \.self) { creator in
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
                    .modifier(HstackModifier2())
                }
            }
        }
    }
}
#Preview {
    TrendingCreatorsView()
}
