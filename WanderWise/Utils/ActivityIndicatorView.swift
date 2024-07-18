//
//  ActivityIndicatorView.swift
//  WanderWise
//
//  Created by Turan Çabuk on 18.07.2024.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }

    typealias UIViewType = UIActivityIndicatorView
}


#Preview {
    ActivityIndicatorView()
}
