//
//  PopularRestaurantsDetailView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 21.07.2024.
//

import SwiftUI
import Kingfisher

struct PopularRestaurantsDetailView: View {
    
    @ObservedObject var viewmodel = PopularRestaurantsDetailViewModel()
    
    var body: some View {
        ScrollView{
            RestaurantView(viewmodel: viewmodel)
            VStack(alignment: .leading, spacing: 8){
                Text("Location & Description")
                    .font(.system(size: 18, weight: .bold))
                HStack {
                    Text(viewmodel.restaurantDetails?.city ?? "")
                        .font(.system(size: 16, weight: .medium))
                    Text(viewmodel.restaurantDetails?.country ?? "")
                        .font(.system(size: 16, weight: .medium))
                }
                HStack{
                    ForEach(0...2, id: \.self) { _ in
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                            .font(.system(size: 18))
                    }
                }
                Text(viewmodel.restaurantDetails?.description ?? "")
                    .font(.system(size: 16, weight: .regular))
                Spacer()
                Text("Popular Dishes")
                    .font(.system(size: 18, weight: .bold))
            }.padding(.horizontal, 12)
                .padding(.vertical, 24)
            ScrollView(.horizontal){
                DishView(viewmodel: viewmodel)
            }.scrollIndicators(.hidden)
            VStack(alignment: .leading) {
                Text("Customer Reviews")
                    .font(.system(size: 18, weight: .bold))
                    .padding()
                ScrollView(.vertical){
                    ReviewView(viewmodel: viewmodel)
                }
            }.padding(.vertical)
        }.navigationBarTitle("Restaurant Detail", displayMode: .inline)
            .padding(.bottom)
    }
}
struct RestaurantView: View {
    
    let viewmodel: PopularRestaurantsDetailViewModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: viewmodel.restaurantDetails?.thumbnail ?? ""))
                .resizable()
                .frame(height: 250)
                .scaledToFit()
            LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
            VStack(alignment: .leading, spacing: 6) {
                Text(viewmodel.restaurantDetails?.name ?? "")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(.white)
                HStack {
                    HStack(spacing: 12) {
                        ForEach(0...4, id: \.self) { star in
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                                .frame(width: 12)
                        }
                    }
                    Spacer()
                    NavigationLink(destination: PopularRestaurantsPhotosView(viewmodel: viewmodel)) {
                        Text("See more photos")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }.padding()
        }
    }
}
struct DishView: View {
    
    let viewmodel: PopularRestaurantsDetailViewModel
    
    var body: some View {
        HStack(spacing: 8){
            ForEach(viewmodel.restaurantDetails?.popularDishes ?? [], id: \.self) { dishes in
                VStack(alignment: .leading){
                    ZStack(alignment: .bottomLeading){
                        KFImage(URL(string: dishes.photo))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 80)
                        LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
                        Text(dishes.price)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                            .padding(4)
                    }
                    .shadow(color: .black, radius: 4)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 2)
                    Text(dishes.name)
                        .font(.system(size: 14, weight: .semibold))
                    Text("\(dishes.numPhotos) Photos")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.trailing)
                }
            }
        }.padding(.leading, 12)
    }
}
struct ReviewView: View {
    
    let viewmodel: PopularRestaurantsDetailViewModel
    
    var body: some View {
        ForEach(viewmodel.restaurantDetails?.reviews ?? [], id: \.self) { customer in
            VStack(alignment: .leading ) {
                HStack{
                    KFImage(URL(string: customer.user.profileImage))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42, height: 42)
                        .cornerRadius(.infinity)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(customer.user.firstName)
                                .font(.system(size: 16, weight: .semibold))
                            Text(customer.user.lastName)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        HStack(spacing: 4) {
                            ForEach(0..<customer.rating, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                            }
                            ForEach(0..<5 - customer.rating, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.gray)
                            }
                        }.font(.system(size: 12))
                    }.padding(.horizontal, 6)
                    Spacer()
                    Text("20 Dec 2023")
                        .font(.system(size: 12, weight: .regular))
                }
                Text(customer.text)
                    .font(.system(size: 14, weight: .regular))
            }.padding(.horizontal)
                .padding(.vertical, 8)
            Divider()
        }
    }
}
#Preview {
    PopularRestaurantsDetailView()
}

