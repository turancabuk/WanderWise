//
//  ViewModifiers.swift
//  WanderWise
//
//  Created by Turan Çabuk on 16.07.2024.
//

import SwiftUI

struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(Color(.init(white: 0.95, alpha: 0.3)))
            .cornerRadius(10)
            .padding(16)
    }
}
struct CustomModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.init(white: 0.95, alpha: 1)))
            .cornerRadius(16)
            .padding(.top, 54)
    }
}
struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24))
            .foregroundColor(Color(.orange))
            .frame(width: 68, height: 68)
            .background(Color.white)
            .cornerRadius(.infinity)
            .shadow(color: .gray, radius: 5)
    }
}
struct ImageModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(6)
            .padding(.top, 6)
    }
}
struct ImageModifier3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 64, height: 64)
            .clipped()
            .cornerRadius(5)
            .padding(.vertical, 6)
            .padding(.leading, 6)
    }
}
struct ImageModifier4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 50, height: 50)
            .cornerRadius(.infinity)
            .shadow(color: .gray, radius: 4, x: 0, y: 2)
    }
}
struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.white)
    }
}
struct TextModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .semibold))
            .padding(.horizontal, 4)
    }
}
struct HstackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250)
            .shadow(color: .gray, radius: 4, x: 0, y: 2)
            .background(Color.white)
        
    }
}
struct HstackModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.bottom)
    }
}
struct VstackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 6)
                .padding(.bottom, 6)
            .frame(width: 125, height: 150)
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .gray, radius: 4, x: 0.0, y: 2.0)
            .padding(.bottom)
    }
}
struct ForeachModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(8)
            .shadow(color: .gray, radius: 4, x: 0, y: 2)
            .padding(.vertical, 4)
    }
}

