//
//  TrendingCreatorsDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 27.07.2024.
//

import SwiftUI
import Kingfisher

struct TrendingCreatorsDetailView: View {
    
    @ObservedObject var viewmodel: PopularRestaurantsDetailViewModel
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .center, spacing: 18){
                    Image("amy")
                        .resizable()
                        .frame(width: 86, height: 86)
                        .scaledToFit()
                        .cornerRadius(.infinity)
                        .shadow(color: .black, radius: 10)
                        .padding(.vertical)
                    HStack(alignment: .center){
                        Text("name")
                        Text("surname")
                    }.foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    HStack{
                        Text("@username")
                        Image(systemName: "hand.thumbsup.fill")
                        Text("14031")
                    }.font(.system(size: 12, weight: .regular))
                        .foregroundColor(.black)
                    HStack{
                        Text("Youtuber")
                        Text("Vlogger")
                        Text("Travel ")
                    }.foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                    HStack{
                        VStack(spacing: 6){
                            Text("Follower")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                            Text("Followers")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        Divider()
                        VStack(spacing: 6){
                            Text("Following")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                            Text("Following")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.gray)
                        }
                    }
                    HStack(spacing: 20){
                        Button("Follow", action: {})
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .background(Color.orange)
                            .cornerRadius(16)
                        Button("Contact", action: {})
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(16)
                    }
                    .padding()
                    ForEach(0...10, id: \.self) { _ in
                        HStack {
                            Spacer()
                                .frame(height: 220)
                                .background(Color.init(white: 0.9))
                                .cornerRadius(24)
                                .padding(.horizontal, 10)
                                .shadow(radius: 6)
                        }
                    }
                }
            }.navigationBarTitle("creator name", displayMode: .inline)
        }
    }
}

#Preview {
    TrendingCreatorsDetailView(viewmodel: PopularRestaurantsDetailViewModel())
}
