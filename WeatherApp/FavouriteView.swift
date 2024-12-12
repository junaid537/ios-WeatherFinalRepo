//
//  FavouriteView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 13/12/24.
//

import SwiftUI

struct FavouriteView: View {
    let index: Int
    var body: some View {
        
        ZStack {
            BackgroundView()
            VStack {
                Text("Favourite View \(index)")
                                    .font(.largeTitle)
                                    .padding()
                HStack {
                    //let weatherDescription = keyValueMap[String(Int(weatherCode))] ?? "Unknown Weather"
                    //Image("\(keyValueMap["\(weatherCode)"])")
                    Image("Clear")
                    VStack(alignment: .leading) {
                        //Text("\(String(format: "%.2f", temperature))°F")
                        Text("56.90 °F")
                            .font(.title)
                            .foregroundColor(.black)
                        Text("Clear")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("Los Angeles")
                            .font(.system(size: 29, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
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
                //2nd view :
                HStack(spacing: 14) {
                    ParametersView(metric: "Humidity", metricImageName: "Humidity", value:"89 %")
                    ParametersView(metric: "Wind Speed", metricImageName: "WindSpeed", value: "90 mph")
                    ParametersView(metric: "Visibility", metricImageName: "Visibility", value: "43 mi")
                    ParametersView(metric: "Pressure", metricImageName: "Pressure", value: "45 inHg")
                }
                
            }
            .padding(.top, 35)
        }
        .padding(.top, 0)
        
    }
}




//3rd view
/*ZStack {
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
.frame(maxHeight: 400)*/
