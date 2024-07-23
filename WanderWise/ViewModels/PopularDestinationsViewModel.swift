//
//  PopularDestinationsViewModel.swift
//  WanderWise
//
//  Created by Turan Çabuk on 22.07.2024.
//

import SwiftUI
import MapKit


class PopularDestinationsViewModel: ObservableObject {
    
    @Published var cityDestinations: [PopularDestinations] = []
    @Published var selectedDestination: PopularDestinations?
    @Published var attractions: [AttractionModel] = []
    @Published var toggleIsOn = false
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    init() {
        DispatchQueue.main.async {
            self.fetchDestinations()
        }
    }
    
    func fetchDestinations() {
        DispatchQueue.global().async {
            let destinations = [
                PopularDestinations(country: "France", city: "Paris", image: ["eiffel_tower", "paris2", "paris3"], latitude: 48.855014, longitudee: 2.341231),
                PopularDestinations(country: "Japan", city: "Tokyo", image: ["japan", "tokyo2", "tokyo3"], latitude: 35.67988, longitudee: 139.7695),
                PopularDestinations(country: "United States", city: "New York", image: ["new_york", "new_york2", "new_york3"], latitude: 40.71592, longitudee: -74.0055),
            ]
            DispatchQueue.main.async {
                self.cityDestinations = destinations
            }
        }
    }
    
    func fetchAttractions(for city: String) {
        DispatchQueue.global().async {
            var fetchedAttractions: [AttractionModel] = []
            switch city {
            case "Paris":
                fetchedAttractions = [
                    .init(name: "Eiffel Tower", image: "eiffel_tower", latitude: 48.859565, longitude: 2.353235),
                    .init(name: "Champs-Elysees", image: "Champs-Elysees", latitude: 48.866867, longitude: 2.311780),
                    .init(name: "Louvre Museum", image: "Louvre Museum", latitude: 48.860288, longitude: 2.337789)
                ]
            case "Tokyo":
                fetchedAttractions = [
                    .init(name: "Tokyo Tower", image: "tokyo_tower", latitude: 35.6586, longitude: 139.7454),
                    .init(name: "Sensoji Temple", image: "sensoji", latitude: 35.7148, longitude: 139.7967),
                    .init(name: "Shibuya Crossing", image: "shibuya_crossing", latitude: 35.6595, longitude: 139.7005)
                ]
            case "New York":
                fetchedAttractions = [
                    .init(name: "Statue of Liberty", image: "statue_of_liberty", latitude: 40.6892, longitude: -74.0445),
                    .init(name: "Times Square", image: "times_square", latitude: 40.7580, longitude: -73.9855),
                    .init(name: "Central Park", image: "central_park", latitude: 40.7851, longitude: -73.9683)
                ]
            default:
                break
            }
            DispatchQueue.main.async {
                self.attractions = fetchedAttractions
            }
        }
    }
    
    func selectDestination(_ destination: PopularDestinations) {
        self.selectedDestination = destination
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: destination.latitude, longitude: destination.longitudee),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        fetchAttractions(for: destination.city)
    }
}
