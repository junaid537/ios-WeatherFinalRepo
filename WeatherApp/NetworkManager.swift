//
//  NeyworkManager.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 23/11/24.
//
struct GeocodeResponse: Codable {
    let results: [GeocodeResult]
    let status: String
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

enum GeocodeError: Error {
    case invalidURL
    case unableToComplete
    case invalidData
    case invalidResponse
}
import Foundation
import Alamofire
/*
final class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.tomorrow.io/v4/timelines?location=34,118&fields=temperature,sunriseTime,sunsetTime,temperatureApparent,temperatureMin,temperatureMax,windSpeed,windDirection,pressureSeaLevel,weatherCode,precipitationProbability,precipitationType,visibility,moonPhase,cloudCover,humidity,uvIndex&units=imperial&timesteps=1d,1h&startTime=now&timezone=America/Los_Angeles&apikey=XOqfWek85TE1R2UOftXMwodhVfThI98F"
    
    private let baseGeoURL="https://maps.googleapis.com/maps/api/geocode/json?address=Los%20Angeles&key=AIzaSyDHEr213qARbTv1YdIFeeRQaRvhYw8rbrY"
    private init() {}
    func getCoordinates(completed: @escaping (Result<Location, GeocodeError>) -> Void) {
            
        guard let url = URL(string: baseGeoURL) else {
                completed(.failure(.invalidURL))
                return
            }

            // Request using Alamofire
            AF.request(url)
                .validate() // Validate status code
                .responseDecodable(of: GeocodeResponse.self) { response in
                    switch response.result {
                    case .success(let decodedResponse):
                        // Extract latitude and longitude
                        if let location = decodedResponse.results.first?.geometry.location {
                            print(decodedResponse.results.first?.geometry.location)
                            completed(.success(location))
                        } else {
                            completed(.failure(.invalidData))
                        }
                    case .failure(let error):
                        // Handle errors
                        print("Request failed: \(error.localizedDescription)")
                        completed(.failure(.unableToComplete))
                    }
                }
        }
    
    func getTomorrowData(completed: @escaping (Result<APIResponse, TomorrowError>) -> Void) {
        AF.request(baseURL)
            .validate() // Validates response status code (e.g., 200–299)
            .responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    // Successfully decoded API response
                    //print(decodedResponse) // Debugging log for decoded response
                    print(decodedResponse.data.timelines?.first?.intervals?.first?.values?.humidity)
                    completed(.success(decodedResponse))
                case .failure(let error):
                    // Handle errors
                    print("Request failed: \(error.localizedDescription)")
                    //print(response)
                    if let afError = error.asAFError, case .responseValidationFailed(reason: .dataFileNil) = afError {
                        completed(.failure(.invalidData))
                    } else if let decodingError = error.asAFError, case .responseSerializationFailed(reason: .decodingFailed) = decodingError {
                        print("Decoding failed: \(error.localizedDescription)")
                        completed(.failure(.invalidData))
                    } else {
                        completed(.failure(.unableToComplete))
                    }
                }
            }
    }

}hello*/
/*
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private let baseTomorrowURL = "https://api.tomorrow.io/v4/timelines"
    private let geocodeBaseURL = "https://maps.googleapis.com/maps/api/geocode/json"//?address=${street}+${city}+${state}&key=${apiKey}
    private let googleAPIKey = "AIzaSyDHEr213qARbTv1YdIFeeRQaRvhYw8rbrY" // Replace with your Google API key

    private init() {}

    // Step 1: Get coordinates from Google Geocode API
    func getCoordinates(for address: String, completed: @escaping (Result<(Double, Double), Error>) -> Void) {
        let geocodeURL = "\(geocodeBaseURL)?address=\(address)&key=\(googleAPIKey)"
        
        AF.request(geocodeURL).responseDecodable(of: GeocodeResponse.self) { response in
            switch response.result {
            case .success(let geocodeResponse):
                if let firstResult = geocodeResponse.results.first {
                    let location = firstResult.geometry.location
                    completed(.success((location.lat, location.lng)))
                } else {
                    completed(.failure(NSError(domain: "GeocodeError", code: 100, userInfo: [NSLocalizedDescriptionKey: "No coordinates found for the given address."])))
                }
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    // Step 2: Fetch Tomorrow data using coordinates
    func getTomorrowData(lat: Double, lng: Double, completed: @escaping (Result<APIResponse, TomorrowError>) -> Void) {
        let baseURL = "\(baseTomorrowURL)?location=\(lat),\(lng)&fields=temperature,sunriseTime,sunsetTime,temperatureApparent,temperatureMin,temperatureMax,windSpeed,windDirection,pressureSeaLevel,weatherCode,precipitationProbability,precipitationType,visibility,moonPhase,cloudCover,humidity,uvIndex&units=imperial&timesteps=1d,1h&startTime=now&timezone=America/Los_Angeles&apikey=XOqfWek85TE1R2UOftXMwodhVfThI98F"
        
        AF.request(baseURL)
            .validate() // Validates response status code (e.g., 200–299)
            .responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    print(decodedResponse) // Debugging log for decoded response
                    completed(.success(decodedResponse))
                case .failure(let error):
                    print("Request failed: \(error.localizedDescription)")
                    if let afError = error.asAFError, case .responseValidationFailed(reason: .dataFileNil) = afError {
                        completed(.failure(.invalidData))
                    } else if let decodingError = error.asAFError, case .responseSerializationFailed(reason: .decodingFailed) = decodingError {
                        print("Decoding failed: \(error.localizedDescription)")
                        completed(.failure(.invalidData))
                    } else {
                        completed(.failure(.unableToComplete))
                    }
                }
            }
    }
}

// Geocode API Response Struct
struct GeocodeResponse: Codable {
    let results: [GeocodeResult]
}

struct GeocodeResult: Codable {
    let geometry: GeocodeGeometry
}

struct GeocodeGeometry: Codable {
    let location: GeocodeLocation
}

struct GeocodeLocation: Codable {
    let lat: Double
    let lng: Double
}
*/

func convertSpacesToPercent20(in sentence: String) -> String {
    return sentence.replacingOccurrences(of: " ", with: "%20")
}

final class NetworkManager {
    static let shared = NetworkManager()
    //private var lat = 0
    //private var lng = 0
    
//    private let baseGeoURL="https://maps.googleapis.com/maps/api/geocode/json?address=Los%20Angeles&key=AIzaSyDHEr213qARbTv1YdIFeeRQaRvhYw8rbrY"
    private init() {}
    func getCoordinates(selectedLocation: String, completed: @escaping (Result<Location, GeocodeError>) -> Void) {
        
        print(selectedLocation)
        let baseGeoURL="https://maps.googleapis.com/maps/api/geocode/json?address=\(selectedLocation)&key=AIzaSyDHEr213qARbTv1YdIFeeRQaRvhYw8rbrY"
        
        guard let url = URL(string: baseGeoURL) else {
                completed(.failure(.invalidURL))
                return
            }

            // Request using Alamofire
            AF.request(url)
                .validate() // Validate status code
                .responseDecodable(of: GeocodeResponse.self) { response in
                    switch response.result {
                    case .success(let decodedResponse):
                        // Extract latitude and longitude
                        if let location = decodedResponse.results.first?.geometry.location {
                            //self.lat = Int(location.lat)
                            //self.lng = Int(location.lng)
                            print(decodedResponse.results.first?.geometry.location)
                            completed(.success(location))
                        } else {
                            completed(.failure(.invalidData))
                        }
                    case .failure(let error):
                        // Handle errors
                        print("Request failed: \(error.localizedDescription)")
                        completed(.failure(.unableToComplete))
                    }
                }
        }
    
    func getTomorrowData(lat: Double, lng: Double, completed: @escaping (Result<APIResponse, TomorrowError>) -> Void) {
        let baseURL = "https://nodeprojecthw3.wl.r.appspot.com/api/v2/tomorrow?lat=\(lat)&long=\(lng)" /*"https://api.tomorrow.io/v4/timelines?location=\(la),\(ln)&fields=temperature,sunriseTime,sunsetTime,temperatureApparent,temperatureMin,temperatureMax,windSpeed,windDirection,pressureSeaLevel,weatherCode,precipitationProbability,precipitationType,visibility,moonPhase,cloudCover,humidity,uvIndex&units=imperial&timesteps=1d,1h&startTime=now&timezone=America/Los_Angeles&apikey=XOqfWek85TE1R2UOftXMwodhVfThI98F"*/
        
        AF.request(baseURL)
            .validate() // Validates response status code (e.g., 200–299)
            .responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let decodedResponse):
                    // Successfully decoded API response
                    //print(decodedResponse) // Debugging log for decoded response
                    print(decodedResponse.data.timelines?.first?.intervals?.first?.values?.humidity)
                    //print("inside netw lat is \(self.lat) and long is \(self.lng)")
                    completed(.success(decodedResponse))
                case .failure(let error):
                    // Handle errors
                    print("Request failed: \(error.localizedDescription)")
                    //print(response)
                    if let afError = error.asAFError, case .responseValidationFailed(reason: .dataFileNil) = afError {
                        completed(.failure(.invalidData))
                    } else if let decodingError = error.asAFError, case .responseSerializationFailed(reason: .decodingFailed) = decodingError {
                        print("Decoding failed: \(error.localizedDescription)")
                        completed(.failure(.invalidData))
                    } else {
                        completed(.failure(.unableToComplete))
                    }
                }
            }
    }

}
