//
//  WeatherDataTabView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 24/11/24.
//

import SwiftUI
import Highcharts
import Foundation
/*
// Model to decode the API response
struct APIResponse: Codable {
    let data: DataModel
}

struct DataModel: Codable {
    let timelines: [Timeline]
}

struct Timeline: Codable {
    let intervals: [Interval]
}

struct Interval: Codable {
    let values: WeatherValues
}

struct WeatherValues: Codable {
    let humidity: Double
    let cloudCover: Double
    let precipitationProbability: Double
}
*/

struct WeatherDataTabView: View {
    @Binding var humidity: Double
    @Binding var precipitationProbability: Double
    @Binding var cloudCover: Double
    var body: some View {
        ZStack {
            Image("App_background")
                .resizable()
            VStack{
                HStack {
                    VStack(alignment: .leading, spacing: 16) { // Ensures proper spacing between rows
                        // Row 1
                        HStack {
                            Image("Mostly Clear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            
                            Text("Precipitation : \(String(format: "%.2f", precipitationProbability))%")
                                .font(.title3)
                                .foregroundColor(.black)
                            
                            Spacer() // Pushes content to the leading edge
                        }
                        // Row 2
                        HStack {
                            Image("Humidity")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            
                            Text("Humidity: \(String(format: "%.1f", humidity))%")
                                .font(.title3)
                                .foregroundColor(.black)
                            
                            Spacer() // Pushes content to the leading edge
                        }
                        // Row 3
                        HStack {
                            Image("CloudCover")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            
                            Text("Cloud Cover : \(String(format: "%.2f", cloudCover))%")
                                .font(.title3)
                                .foregroundColor(.black)
                            
                            Spacer() // Pushes content to the leading edge
                        }
                    }
                    .padding(.horizontal, 20)

                   
                    
                    
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
               
                ActivityGaugeView(humidity: $humidity,cloudCover:$cloudCover,precipitationProbability: $precipitationProbability)
                    //.frame(height: 500)
                    //.fixedSize(horizontal: false, vertical: false)
                
            }
        }
    }
    
}

#Preview {
    WeatherDataTabView(humidity: .constant(0),precipitationProbability: .constant(0), cloudCover: .constant(0))
}
