//
//  WasteView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 25/11/24.
//
/*
import SwiftUI
import Alamofire

struct WasteView: View {
    @State private var searchText = ""
    @State private var selectedLocation: String? = nil
    @State private var latitude: Double?
    @State private var longitude: Double?
    @State private var weatherData: APIResponse? // Hold the response from the Tomorrow API

    // Assuming you have a LocationManager or some manager for the list
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        NavigationStack {
            ZStack {
                FrontView()
                VStack {
                    // White background containing the search bar
                    Color.white
                        .frame(height: 139) // Adjust height for the search bar container
                        .edgesIgnoringSafeArea(.top)
                        .overlay(
                            VStack {
                                // Use SwiftUI's searchable modifier
                                List(locationManager.results, id: \.id) { prediction in
                                    Text(prediction.description)
                                        .onTapGesture {
                                            // Handle selection (e.g., fetch coordinates)
                                            self.selectedLocation = prediction.description
                                            print("Selected: \(prediction.description)")

                                            // Get coordinates based on the selected location
                                            NetworkManager.shared.getCoordinates(for: prediction.description) { result in
                                                switch result {
                                                case .success(let location):
                                                    self.latitude = location.lat
                                                    self.longitude = location.lng
                                                    
                                                    // Now fetch tomorrow's weather data using the latitude and longitude
                                                    fetchTomorrowData()
                                                    
                                                case .failure(let error):
                                                    print("Error fetching coordinates: \(error)")
                                                }
                                            }
                                        }
                                }
                                .searchable(text: $searchText, prompt: "Enter city name...")
                                .onChange(of: searchText) { newValue in
                                    locationManager.query = newValue // Trigger search in manager
                                }
                                .listStyle(.plain) // Simplify the dropdown list style
                                .frame(maxHeight: searchText.isEmpty ? 0 : 250) // Show list only when there is text
                                .background(Color.white) // Ensure dropdown list background is white
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a shadow
                                .padding(.horizontal, 16) // Center the search box horizontally
                                .zIndex(5)
                                .scrollContentBackground(.hidden) // Allow for scrollable content
                            }
                        )
                        .zIndex(1) // Ensures the search bar and its results are on top of other views
                    
                    // Main content (add your other views here)
                    Spacer()

                    // Show the weather data after it's fetched
                    if let weatherData = weatherData {
                        Text("Tomorrow's weather: \(weatherData.temperature)")
                            .padding()
                    }
                }
            }
        }
    }

    func fetchTomorrowData() {
        guard let lat = latitude, let lon = longitude else { return }

        NetworkManager.shared.getTomorrowData(latitude: lat, longitude: lon) { result in
            switch result {
            case .success(let data):
                self.weatherData = data
            case .failure(let error):
                print("Error fetching tomorrow's data: \(error)")
            }
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let geocodeBaseURL = "https://maps.googleapis.com/maps/api/geocode/json"
    private let tomorrowBaseURL = "https://api.tomorrow.io/v4/timelines"

    private init() {}

    // Function to get coordinates based on location description (city)
    func getCoordinates(for locationDescription: String, completed: @escaping (Result<Location, GeocodeError>) -> Void) {
        let urlString = "\(geocodeBaseURL)?address=\(locationDescription)&key=YOUR_GOOGLE_API_KEY"
        
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }

        AF.request(url)
            .validate()
            .responseDecodable(of: GeocodeResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    if let location = decodedResponse.results.first?.geometry.location {
                        completed(.success(location))
                    } else {
                        completed(.failure(.invalidData))
                    }
                case .failure(let error):
                    completed(.failure(.unableToComplete))
                    print("Request failed: \(error.localizedDescription)")
                }
            }
    }

    // Function to get Tomorrow's data using latitude and longitude
    func getTomorrowData(latitude: Double, longitude: Double, completed: @escaping (Result<APIResponse, TomorrowError>) -> Void) {
        let urlString = "\(tomorrowBaseURL)?location=\(latitude),\(longitude)&fields=temperature&units=imperial&timesteps=1d&startTime=now&timezone=America/Los_Angeles&apikey=YOUR_TOMORROW_API_KEY"
        
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }

        AF.request(url)
            .validate()
            .responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    completed(.success(decodedResponse))
                case .failure(let error):
                    completed(.failure(.unableToComplete))
                    print("Request failed: \(error.localizedDescription)")
                }
            }
    }
}

// Assume these are the response models for API response
struct GeocodeResponse: Codable {
    let results: [GeocodeResult]
}

struct GeocodeResult: Codable {
    let geometry: Geometry
}

struct Geometry: Codable {
    let location: Location
}

struct Location: Codable {
    let lat: Double
    let lng: Double
}

struct APIResponse: Codable {
    let temperature: Double
}

enum GeocodeError: Error {
    case invalidURL
    case unableToComplete
    case invalidData
}

enum TomorrowError: Error {
    case invalidURL
    case unableToComplete
}

#Preview {
    WasteView()
}
*/
/*
import SwiftUI

// Mock Data Model
struct WeatherDataThirdSubview: Identifiable {
    let id = UUID()
    let startTime: String
    let weatherCode: Double
    let sunriseTime: String
    let sunsetTime: String
}

// Mock Weather Code Mapping
let weatherCodeMapping: [Int: (image: String)] = [
    1000: (image: "clear-sky"),
    1001: (image: "partly-cloudy"),
    1100: (image: "mostly-clear"),
    2000: (image: "fog"),
    8000: (image: "thunderstorm"),
    5100: (image: "light-snow"),
    6000: (image: "freezing-rain")
]

// Helper function to convert date string to "MM/dd/yyyy"
func convertToMMDDYYYY(dateString: String) -> String {
    let formatter = ISO8601DateFormatter()
    if let date = formatter.date(from: dateString) {
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "MM/dd/yyyy"
        return displayFormatter.string(from: date)
    }
    return "Unknown Date"
}

// Helper function to convert sunrise/sunset time strings into readable time
func formatTime(from timeString: String) -> String {
    let formatter = ISO8601DateFormatter()
    if let date = formatter.date(from: timeString) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        return timeFormatter.string(from: date)
    }
    return "Unknown Time"
}

struct ContentView: View {
    // Mock Data
    @State private var weatherDataThirdSubview: [WeatherDataThirdSubview] = [
        WeatherDataThirdSubview(startTime: "2024-12-11T06:00:00Z", weatherCode: 1000, sunriseTime: "2024-12-11T14:39:00Z", sunsetTime: "2024-12-11T00:54:00Z"),
        WeatherDataThirdSubview(startTime: "2024-12-12T06:00:00Z", weatherCode: 1001, sunriseTime: "2024-12-12T14:39:00Z", sunsetTime: "2024-12-12T00:54:00Z"),
        WeatherDataThirdSubview(startTime: "2024-12-13T06:00:00Z", weatherCode: 2000, sunriseTime: "2024-12-13T14:40:00Z", sunsetTime: "2024-12-13T00:54:00Z"),
        WeatherDataThirdSubview(startTime: "2024-12-14T06:00:00Z", weatherCode: 8000, sunriseTime: "2024-12-14T14:41:00Z", sunsetTime: "2024-12-14T00:55:00Z"),
        WeatherDataThirdSubview(startTime: "2024-12-15T06:00:00Z", weatherCode: 5100, sunriseTime: "2024-12-15T14:41:00Z", sunsetTime: "2024-12-15T00:55:00Z"),
        WeatherDataThirdSubview(startTime: "2024-12-16T06:00:00Z", weatherCode: 6000, sunriseTime: "2024-12-16T14:42:00Z", sunsetTime: "2024-12-16T00:55:00Z")
    ]
    
    var body: some View {
        List(weatherDataThirdSubview, id: \.startTime) { data in
            VStack(spacing: 0) {
                HStack {
                    Text("\(convertToMMDDYYYY(dateString: data.startTime))")
                        .font(.system(size: 10))
                    
                    Spacer()
                    
                    // Weather Image based on weatherCode
                    Image(weatherCodeMapping[Int(data.weatherCode)]?.image ?? "defaultImage")
                        .resizable()
                        .frame(width: 22, height: 22)
                    
                    Spacer()
                    
                    Text("\(formatTime(from: data.sunriseTime))")
                        .font(.system(size: 10))
                    
                    Spacer()
                    
                    Image("sun-rise")
                        .resizable()
                        .frame(width: 22, height: 22)
                    
                    Spacer()
                    
                    Text("\(formatTime(from: data.sunsetTime))")
                        .font(.system(size: 10))
                    
                    Spacer()
                    
                    Image("sun-set")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                
                // Divider Logic
                if let index = weatherDataThirdSubview.firstIndex(where: { $0.startTime == data.startTime }),
                   index < weatherDataThirdSubview.count - 1 {
                    Divider()
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(0)
            .background(Color.white.opacity(0.5))
            .listRowBackground(Color.clear)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
