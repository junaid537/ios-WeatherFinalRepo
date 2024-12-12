//
//  WeeklyTabView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 24/11/24.
//
/*
import SwiftUI
let keyValueMap: [String: String] = [
        "1000":"Clear",
        "1100":"Mostly Clear",
        "1101":"Partly Cloudy",
        "1102":"Mostly Cloudy",
        "1001":"Cloudy",
        "2000":"Fog",
        "2100":"Light Fog",
        "8000":"Thunderstorm",
        "5001":"Flurries",
        "5100":"Light Snow",
        "5101":"Heavy Snow",
        "7102":"Light Ice Pellets",
        "7000":"Ice pellets",
        "7101":"Heavy Ice Pellets",
        "4000":"Drizzle",
        "6000":"Freezing Drizzle",
        "6200":"Light Freezing Rain",
        "6001":"Freezing Rain",
        "6201":"Heavy Freezing Rain",
        "4200":"Light Rain",
        "4001":"Rain",
        "4201":"Heavy Rain",
    ]
struct WeeklyTabView: View {
    @Binding var areaRangeData: [(startTime: String, minTemperature: Double,maxTemperature: Double)]
    @Binding var temperature: Double
    @Binding var weatherCode:Double
   
    var body: some View {
        
        ZStack {
            Image("App_background")
                .resizable()
            VStack{
                HStack {
                    Image(keyValueMap[Int(weatherCode)])
                    Spacer()
                        .frame(width: 50)
                    VStack(alignment: .leading) {
                        Text(keyValueMap[Int(weatherCode)])
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("\(String(format: "%.2f", temperature))°F")
                            .font(.title)
                            .foregroundColor(.black)
                        
                        
                    }
                }
                .frame(width: 350, height : 200)
                .padding()
                
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.4))
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                .padding(.horizontal, 20)
                
                AreaRangeView(areaRangeData: $areaRangeData)
            }
        }
      
    }
}

#Preview {
    WeeklyTabView(areaRangeData: .constant([
        (startTime: "2024-12-11T06:00:00-08:00",minTemperature: 15.3, maxTemperature: 25.5 ),
        (startTime: "2024-12-12T06:00:00-08:00",minTemperature: 18.5, maxTemperature: 28.0),
        (startTime: "2024-12-13T06:00:00-08:00",minTemperature: 20.0, maxTemperature: 30.2),
        (startTime: "2024-12-14T06:00:00-08:00",minTemperature: 17.6, maxTemperature: 27.8)
    ]),temperature: .constant(0),weatherCode: .constant(0))
}
*/
import SwiftUI

let keyValueMap: [String: String] = [
    "1000": "Clear",
    "1100": "Mostly Clear",
    "1101": "Partly Cloudy",
    "1102": "Mostly Cloudy",
    "1001": "Cloudy",
    "2000": "Fog",
    "2100": "Light Fog",
    "8000": "Thunderstorm",
    "5001": "Flurries",
    "5100": "Light Snow",
    "5101": "Heavy Snow",
    "7102": "Light Ice Pellets",
    "7000": "Ice pellets",
    "7101": "Heavy Ice Pellets",
    "4000": "Drizzle",
    "6000": "Freezing Drizzle",
    "6200": "Light Freezing Rain",
    "6001": "Freezing Rain",
    "6201": "Heavy Freezing Rain",
    "4200": "Light Rain",
    "4001": "Rain",
    "4201": "Heavy Rain",
]

struct WeeklyTabView: View {
    @Binding var areaRangeData: [(startTime: String, minTemperature: Double, maxTemperature: Double)]
    @Binding var temperature: Double
    @Binding var weatherCode: Double

    var weatherDescription: String {
        keyValueMap[String(Int(weatherCode))] ?? "Unknown"
    }

    var body: some View {
        ZStack {
            Image("App_background")
                .resizable()
            
            VStack {
                weatherHeaderView
                
                AreaRangeView(areaRangeData: $areaRangeData)
            }
        }
    }
    
    private var weatherHeaderView: some View {
        HStack {
            Image(weatherDescription)
            
            Spacer()
                .frame(width: 50)
            
            VStack(alignment: .leading) {
                Text(weatherDescription)
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text("\(String(format: "%.2f", temperature))°F")
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .frame(width: 350, height: 200)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.4))
                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 2)
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    WeeklyTabView(
        areaRangeData: .constant([
            (startTime: "2024-12-11T06:00:00-08:00", minTemperature: 15.3, maxTemperature: 25.5),
            (startTime: "2024-12-12T06:00:00-08:00", minTemperature: 18.5, maxTemperature: 28.0),
            (startTime: "2024-12-13T06:00:00-08:00", minTemperature: 20.0, maxTemperature: 30.2),
            (startTime: "2024-12-14T06:00:00-08:00", minTemperature: 17.6, maxTemperature: 27.8)
        ]),
        temperature: .constant(0),
        weatherCode: .constant(0)
    )
}

