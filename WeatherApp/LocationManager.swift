//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 25/11/24.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var location: CLLocation?
    @Published var status: CLAuthorizationStatus?
    @Published var locationName: String? // To store the location name

    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        self.location = latestLocation

        // Perform reverse geocoding
        geocoder.reverseGeocodeLocation(latestLocation) { [weak self] placemarks, error in
            if let error = error {
                print("Error in reverse geocoding: \(error.localizedDescription)")
                self?.locationName = "Unknown location"
                return
            }

            // Extract location name
            if let placemark = placemarks?.first {
                self?.locationName = [placemark.locality, placemark.administrativeArea, placemark.country]
                    .compactMap { $0 } // Filter out nil values
                    .joined(separator: ", ")
            } else {
                self?.locationName = "Unknown location"
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
}
