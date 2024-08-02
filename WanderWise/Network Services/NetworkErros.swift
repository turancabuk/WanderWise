//
//  NetworkErros.swift
//  WanderWise
//
//  Created by Turan Çabuk on 2.08.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
}
