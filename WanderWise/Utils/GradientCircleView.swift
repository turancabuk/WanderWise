//
//  GradientCircleView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 1.08.2024.
//

import SwiftUI

struct GradientCircleView: View {
    
    let gradientColors: [Color]
    @State var degrees: Double
    @State var width: CGFloat
    @State var height: CGFloat
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 25)
                .frame(width: width, height: height)
                .foregroundStyle(.gray.opacity(0.3))
            Circle()
                .stroke(lineWidth: 25)
                .frame(width: width, height: height)
                .foregroundStyle(AngularGradient.init(gradient: Gradient(colors: gradientColors), center: .center))
                .mask {
                    Circle()
                        .trim(from: 0, to: 0.15)
                        .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.degrees(degrees))
                }
                .onAppear(){
                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                        self.degrees += 360
                    }
                }
                .onDisappear {
                    degrees = 0
                }
        }
    }
}

#Preview {
    GradientCircleView(gradientColors: [.red, .green], degrees: 0.0, width: 75, height: 75)
}
