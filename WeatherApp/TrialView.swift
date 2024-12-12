//
//  TrialView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 07/12/24.
//
/*
import SwiftUI

struct TrialView: View {
    @Binding var weatherDataThirdSubview: [(startTime: String, weatherCode: Double, sunriseTime: String, sunsetTime: String)]
    /*struct TableViewRow: Identifiable {
        let id = UUID()
        let date: String
        let weather: String
        let temp: String
        let sunrise: String
        let sunset: String
    }
    
    let tableData: [TableViewRow] = [
        TableViewRow(date: "11/21/2024", weather: "Sunny", temp: "75°F", sunrise: "6:30 AM", sunset: "5:30 PM"),
        TableViewRow(date: "11/22/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:31 AM", sunset: "5:29 PM"),
        TableViewRow(date: "11/22/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:31 AM", sunset: "5:29 PM"),
        TableViewRow(date: "11/22/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:31 AM", sunset: "5:29 PM"),
        
    ]*/
    var body: some View {
        
        List(weatherDataThirdSubview, id: \.startTime) { data in
            VStack(spacing: 0) {
                HStack {
                    Text("\(data.startTime)")
                    Spacer()
                    Text("\(data.weatherCode)")
                    //Text(tableData[index].temp)
                    Spacer()
                    Text("\(data.sunriseTime)")
                    Spacer()
                    Text("\(data.sunsetTime)")
                }
                .padding()
                
                if index < weatherDataThirdSubview.count - 1 { // Add Divider only between rows
                    Divider()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 0)
                }
            }
            .padding(0)
            .background(Color.white.opacity(0.5)) // Optional: Uncomment if you want a semi-transparent background
            .listRowBackground(Color.clear) // Remove default background
            .listRowInsets(EdgeInsets())
        }
        .listStyle(PlainListStyle())
        
    }
}

#Preview {
    TrialView(weatherDataThirdSubview: .constant([
        (startTime: "2024-12-11T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-11T14:39:00Z", sunsetTime: "2024-12-11T00:54:00Z"),
        (startTime: "2024-12-12T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-12T14:39:00Z", sunsetTime: "2024-12-12T00:54:00Z"),
        (startTime: "2024-12-13T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-13T14:40:00Z", sunsetTime: "2024-12-13T00:54:00Z"),
        (startTime: "2024-12-14T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-14T14:41:00Z", sunsetTime: "2024-12-14T00:55:00Z"),
        (startTime: "2024-12-15T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-15T14:41:00Z", sunsetTime: "2024-12-15T00:55:00Z"),
        (startTime: "2024-12-16T06:00:00-08:00", weatherCode: 1100, sunriseTime: "2024-12-16T14:42:00Z", sunsetTime: "2024-12-16T00:55:00Z")
    ]))
}

*/
import SwiftUI
struct WeatherCodeInfo {
    let status: String
    let image: String
}
struct TrialView: View {
    @Binding var weatherDataThirdSubview: [(startTime: String, weatherCode: Double, sunriseTime: String, sunsetTime: String)]
    let weatherCodeMapping: [Int: WeatherCodeInfo] = [
        1000: WeatherCodeInfo(status: "Clear", image: "Clear"),//
        1100: WeatherCodeInfo(status: "Mostly Clear", image: "Mostly Clear"),
        1101: WeatherCodeInfo(status: "Partly Cloudy", image: "Partly Cloudy"),
        1102: WeatherCodeInfo(status: "Mostly Cloudy", image: "Mostly Cloudy"),
        1001: WeatherCodeInfo(status: "Cloudy", image: "Cloudy"),//
        2000: WeatherCodeInfo(status: "Fog", image: "Fog"),
        2100: WeatherCodeInfo(status: "Light Fog", image: "Light Fog"),
        8000: WeatherCodeInfo(status: "Thunderstorm", image: "Thunderstorm"),
        5001: WeatherCodeInfo(status: "Flurries", image: "Flurries"),
        5100: WeatherCodeInfo(status: "Light Snow", image: "Light Snow"),
        5000: WeatherCodeInfo(status: "Snow", image: "Snow"),
        5101: WeatherCodeInfo(status: "Heavy Snow", image: "Heavy Snow"),
        7102: WeatherCodeInfo(status: "Light Ice Pellets", image: "Light Ice Pellets"),
        7000: WeatherCodeInfo(status: "Ice pellets", image: "Ice Pellets"),
        7101: WeatherCodeInfo(status: "Heavy Ice Pellets", image: "Heavy Ice Pellets"),
        4000: WeatherCodeInfo(status: "Drizzle", image: "Drizzle"),
        6000: WeatherCodeInfo(status: "Freezing Drizzle", image: "Freezing Drizzle"),
        6200: WeatherCodeInfo(status: "Light Freezing Rain", image: "Light Freezing Rain"),
        6001: WeatherCodeInfo(status: "Freezing Rain", image: "Freezing Rain"),
        6201: WeatherCodeInfo(status: "Heavy Freezing Rain", image: "Heavy Freezing Rain"),
        4200: WeatherCodeInfo(status: "Light Rain", image: "Light Rain"),
        4001: WeatherCodeInfo(status: "Rain", image: "Rain"),//
        4201: WeatherCodeInfo(status: "Heavy Rain", image: "Heavy Rain")//
    ]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8)) // Set the background color and opacity
                //.fill(Color.blue.opacity(0.2))
                .shadow(radius: 4) // Optional: Add shadow for a better effect
                .padding(.horizontal, 16)
            List(weatherDataThirdSubview, id: \.startTime) { data in
                VStack(spacing: 0) {
                    HStack {
                        Text("\(convertToMMDDYYYY(dateString: data.startTime))")
                            .font(.system(size: 10))
                        Spacer()
                        //Image(weatherCodeMapping[Int(data.weatherCode)].image)
                        Image(weatherCodeMapping[Int(data.weatherCode)]?.image ?? "defaultImage")
                            .resizable()
                            .frame(width: 22, height: 22)
                        Spacer()
                        Text("\(formatTime(from: data.sunriseTime))")
                            .font(.system(size: 10))
                        Spacer()
                        Image("sun-rise")
                        Spacer()
                        Text("\(formatTime(from: data.sunsetTime))")
                            .font(.system(size: 10))
                        Spacer()
                        Image("sun-set")
                    }
                    .padding(.vertical, 4) // Reduce vertical padding
                    .padding(.horizontal, 8) // Reduce horizontal padding
                    
                    if let index = weatherDataThirdSubview.firstIndex(where: { $0.startTime == data.startTime }),
                       index < weatherDataThirdSubview.count - 1 {
                        Divider()
                            .frame(maxWidth: .infinity)
                        //.padding(.horizontal, 0)
                    }
                }
                .padding(0)
                .background(Color.white.opacity(0.5)) // Optional: Uncomment if you want a semi-transparent background
                .listRowBackground(Color.clear) // Remove default background
                //.listRowInsets(EdgeInsets())
            }
            .listStyle(PlainListStyle())
            .frame(maxHeight: 400)
            .padding(.horizontal, 0)
            //.frame(height: 150)
        }
        .padding(.horizontal, 16) // Padding around the ZStack for outer spacing
        .frame(maxHeight: 400)
        }
    func formatTime(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Input format
        // No need to set the timeZone for the input since it's provided in the date string

        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "h:mm a" // Desired output format
            dateFormatter.timeZone = TimeZone(identifier: "PST") // Convert explicitly to PST timezone
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }

    func convertToMMDDYYYY(dateString: String) -> String {
        let dateFormatter = DateFormatter()

        // Step 1: Set the input format of the date string
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        // Step 2: Convert string to Date object
        if let date = dateFormatter.date(from: dateString) {
            // Step 3: Set the desired output format
            dateFormatter.dateFormat = "MM/dd/yyyy"
            return dateFormatter.string(from: date) // Convert Date to desired format
        } else {
            return "Invalid Date"
        }
    }
}

struct TrialView_Previews: PreviewProvider {
    static let mockWeatherData: [(startTime: String, weatherCode: Double, sunriseTime: String, sunsetTime: String)] = [
        (startTime: "2024-12-11T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-11T14:39:00Z", sunsetTime: "2024-12-11T00:54:00Z"),
        (startTime: "2024-12-12T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-12T14:39:00Z", sunsetTime: "2024-12-12T00:54:00Z"),
        (startTime: "2024-12-13T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-13T14:40:00Z", sunsetTime: "2024-12-13T00:54:00Z"),
        (startTime: "2024-12-14T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-14T14:41:00Z", sunsetTime: "2024-12-14T00:55:00Z"),
        (startTime: "2024-12-15T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-15T14:41:00Z", sunsetTime: "2024-12-15T00:55:00Z"),
        (startTime: "2024-12-16T06:00:00-08:00", weatherCode: 1100, sunriseTime: "2024-12-16T14:42:00Z", sunsetTime: "2024-12-16T00:55:00Z")
    ]

    static var previews: some View {
        TrialView(weatherDataThirdSubview: .constant(mockWeatherData))
            .previewLayout(.sizeThatFits)
    }
}

#Preview {
    TrialView(weatherDataThirdSubview: .constant([
        (startTime: "2024-12-11T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-11T14:39:00Z", sunsetTime: "2024-12-11T00:54:00Z"),
        (startTime: "2024-12-12T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-12T14:39:00Z", sunsetTime: "2024-12-12T00:54:00Z"),
        (startTime: "2024-12-13T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-13T14:40:00Z", sunsetTime: "2024-12-13T00:54:00Z"),
        (startTime: "2024-12-14T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-14T14:41:00Z", sunsetTime: "2024-12-14T00:55:00Z"),
        (startTime: "2024-12-15T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-15T14:41:00Z", sunsetTime: "2024-12-15T00:55:00Z"),
        (startTime: "2024-12-16T06:00:00-08:00", weatherCode: 1100, sunriseTime: "2024-12-16T14:42:00Z", sunsetTime: "2024-12-16T00:55:00Z")
    ]))
}
