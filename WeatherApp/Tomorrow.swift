//
//  Tomorrow.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 23/11/24.
//


import Foundation

// Root Struct
struct APIResponse: Decodable {
    let data: DataContainer
}

// Data Container
struct DataContainer: Decodable {
    let timelines: [Timeline]?
    let warnings: [Warning]? // Add warnings here

}
// Warning Struct
struct Warning: Decodable {
    let code: Int?
    let type: String?
    let message: String?
    let meta: Meta?
}

// Meta Struct
struct Meta: Decodable {
    let field: String?
    let from: String?
    let to: String?
}


// Timeline with only intervals
struct Timeline: Decodable {
    let timestep: String?
    let endTime: String?
    let startTime: String?
    let intervals: [Interval]?
}

// Interval containing values
struct Interval: Decodable {
    let startTime: String?
    let values: IntervalValues?
}

// Values in each interval
/*struct IntervalValues: Decodable  {
    let cloudCover: Int?
    let humidity: Double?
    let moonPhase: Int?
    let precipitationProbability: Int?
    let precipitationType: Int?
    let pressureSeaLevel: Double?
    let sunriseTime: String?
    let sunsetTime: String?
    let temperature: Double?
    let temperatureApparent: Double?
    let temperatureMax: Double?
    let temperatureMin: Double?
    let uvIndex: Int?
    let visibility: Double?
    let weatherCode: Int?
    let windDirection: Double?
    let windSpeed: Double?
}*/
struct IntervalValues: Decodable  {
    let cloudCover: Double?
    let humidity: Double?
    let moonPhase: Double?
    let precipitationProbability: Double?
    let precipitationType: Double?
    let pressureSeaLevel: Double?
    let sunriseTime: String?
    let sunsetTime: String?
    let temperature: Double?
    let temperatureApparent: Double?
    let temperatureMax: Double?
    let temperatureMin: Double?
    let uvIndex: Double?
    let visibility: Double?
    let weatherCode: Double?
    let windDirection: Double?
    let windSpeed: Double?
}

