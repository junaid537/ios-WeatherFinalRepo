//
//  LocationAutocompleteManager.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 25/11/24.
//

import SwiftUI
import Combine
class LocationAutocompleteManager: ObservableObject {
    @Published var query: String = "" {
        didSet {
            handleSearchFragment(query)
        }
    }
    @Published var results: [Prediction] = []
    @Published var status: SearchStatus = .idle

    private func handleSearchFragment(_ fragment: String) {
        guard !fragment.isEmpty else {
            status = .idle
            results = []
            return
        }

        status = .searching
        fetchAutocompletePredictions(for: fragment)
    }

    private func fetchAutocompletePredictions(for fragment: String) {
        let apiKey = "AIzaSyAPlwfUalccFj01u6Gz_Y4gDbEEuc-ywao"
        let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(fragment)&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.status = .error("Invalid URL")
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            if let error = error {
                DispatchQueue.main.async {
                    self.status = .error(error.localizedDescription)
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    self.status = .error("No data received")
                }
                return
            }

            do {
                let response = try JSONDecoder().decode(AutocompleteResponse.self, from: data)
                DispatchQueue.main.async {
                    if response.status == "OK" {
                        self.results = response.predictions
                        self.status = .result
                    } else {
                        self.status = .error("API Error: \(response.status)")
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.status = .error("Decoding error: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}

struct AutocompleteResponse: Codable {
    let predictions: [Prediction]
    let status: String
}

struct Prediction: Codable, Identifiable, Hashable {
    let id = UUID()
    let description: String
    let placeID: String

    enum CodingKeys: String, CodingKey {
        case description
        case placeID = "place_id"
    }
}

enum SearchStatus: Equatable {
    case idle
    case searching
    case error(String)
    case result
}

