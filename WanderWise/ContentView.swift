//
//  ContentView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 14.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView() {
                DiscoverCategoriesView()
            }.navigationTitle("Discover")
        }
    }
}

#Preview {
    ContentView()
}

struct DiscoverCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12){
                ForEach(0..<5, id: \.self) { num in
                    VStack(spacing: 6) {
                        Spacer()
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5)
                        Text("Deneme")
                            .font(.system(size: 12, weight: .semibold))
                    }
                }
            }.padding()
        }
    }
}
