//
//  NetworkErrors.swift
//  WanderWise
//
//  Created by Turan Çabuk on 2.08.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
           return "The URL provided was invalid."
        case .noData:
           return "No data was received from the server."
        case .decodingError(let error):
           return "Decoding error: \(error.localizedDescription)"
        }
    }
}

