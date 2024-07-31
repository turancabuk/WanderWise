//
//  TrendingCreatorsDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 27.07.2024.
//

import SwiftUI
import Kingfisher

struct TrendingCreatorsDetailView: View {
    
    @ObservedObject var viewmodel: TrendingCreatorsViewModel
    let creator: TrendingCreators
    
    init(creator: TrendingCreators) {
        self.creator = creator
        self.viewmodel = .init(networkService: TrendingCreatorsNetworkService(), userId: creator.id)
    }
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .center, spacing: 18){
                    UserProfileHeader(viewmodel: viewmodel)
                    UserStatsView(viewmodel: viewmodel)
                    PostsListView(viewmodel: viewmodel)
                }
            }.navigationBarTitle(viewmodel.creatorsDetails?.username ?? "", displayMode: .inline)
        }
    }
}
struct UserProfileHeader: View {
    
    let viewmodel: TrendingCreatorsViewModel
    
    var body: some View {
        KFImage(URL(string: viewmodel.creatorsDetails?.profileImage ?? ""))
            .resizable()
            .frame(width: 86, height: 86)
            .scaledToFit()
            .cornerRadius(.infinity)
            .shadow(color: .black, radius: 10)
            .padding(.vertical)
        HStack(alignment: .center){
            Text(viewmodel.creatorsDetails?.firstName ?? "")
            Text(viewmodel.creatorsDetails?.lastName ?? "")
        }.foregroundColor(.black)
            .font(.system(size: 16, weight: .semibold))
        HStack{
            Text(viewmodel.creatorsDetails?.username ?? "")
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
    }
}
struct UserStatsView: View {
    
    let viewmodel: TrendingCreatorsViewModel
    
    var body: some View {
        HStack{
            VStack(spacing: 6){
                Text("\(viewmodel.creatorsDetails?.followers ?? 0)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Text("Followers")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
            }
            Divider()
            VStack(spacing: 6){
                Text("\(viewmodel.creatorsDetails?.following ?? 0)")
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
    }
}
struct PostsListView: View {
    
    let viewmodel: TrendingCreatorsViewModel
    
    var body: some View {
        ForEach(viewmodel.creatorsDetails?.posts ?? [], id: \.self) { photos in
            VStack(alignment: .leading, spacing: 10) {
                KFImage(URL(string: photos.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .shadow(radius: 6)
                HStack{
                    KFImage(URL(string: viewmodel.creatorsDetails?.profileImage ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .cornerRadius(.infinity)
                    VStack(alignment: .leading) {
                        Text(photos.title)
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .semibold))
                        Text("\(photos.views) views")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }.padding(.horizontal, 4)
                HStack(spacing: 12){
                    ForEach(photos.hashtags, id: \.self) { hashtags in
                        Text("#\(hashtags)")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.blue)
                            .padding(4)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                    }
                }.padding(.horizontal, 12)
                    .padding(.bottom)
            }.background(.white)
                .cornerRadius(12)
                .shadow(radius: 10)
                .padding(.horizontal, 10)
        }
    }
}
#Preview {
    TrendingCreatorsDetailView(creator: .init(id: 0, name: "Amy Adams", image: "amy"))
}
