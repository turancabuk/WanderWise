//
//  WanderWiseApp.swift
//  WanderWise
//
//  Created by Turan Çabuk on 14.07.2024.
//

import SwiftUI

@main
struct WanderWiseApp: App {
    
    @State private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            if isActive {
                MainView()
            }else{
                SplashScreenView()
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
        }
    }
}
struct SplashScreenView: View {
    var body: some View {
        VStack{
            HStack{
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            Text("WonderWise")
                .font(.custom("Rilley", size: 44))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(RadialGradient(colors: [.white, .orange], center: .center, startRadius: 0.0, endRadius: 175))
        .edgesIgnoringSafeArea(.all)
    }
}
