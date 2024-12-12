//
//  TodayView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 24/11/24.
//

import SwiftUI

struct TodayView: View {
    @Binding var humidity: Double
    @Binding var temperature: Double
    @Binding var weatherCode: Double
    @Binding var uvIndex: Double
    @Binding var cloudCover: Double
    @Binding var visibility: Double
    @Binding var pressure: Double
    @Binding var windSpeed: Double
    @Binding var precipitationProbability: Double
    
    var body: some View {
        ZStack {
            Image("App_background")
                .resizable()
                //.scaledToFill()
                  //  .frame(width: UIScreen.main.bounds.width, height: 700) // Full width, fixed height
                    //.clipped()
              //  .ignoresSafeArea()
            VStack{
                HStack{
                    // Adjust spacing between elements
                    VStack(alignment: .center,spacing: 15) {
                        Image("WindSpeed")
                        
                        Text("\(String(format: "%.2f", windSpeed)) mph")
                            .font(.subheadline)
                        Text("Wind Speed")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    
                    Spacer()
                    VStack(alignment: .center,spacing: 15) {
                        Image("Pressure")
                        Text("\(String(format: "%.2f", pressure)) inHg")
                            .font(.subheadline)
                        Text("Pressure")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    
                    Spacer()
                    // Adjust spacing between elements
                    VStack(alignment: .center,spacing: 15) {
                        Image("Precipitation")
                        
                        Text("\(String(format: "%.2f", precipitationProbability)) %")
                            .font(.subheadline)
                        Text("Precipitation")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    
                    
                    
                }
                //.padding()//end of 1st HStack
                
                //2nd row
                HStack{
                    // Adjust spacing between elements
                    VStack(alignment: .center,spacing: 15) {
                        Image("Temperature")
                        
                        Text("\(String(format: "%.2f", temperature))°F")
                            .font(.subheadline)
                        Text("Temperature")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    Spacer()
                    
                    // Adjust spacing between elements
                    VStack(alignment: .center,spacing: 15) {
                        Image("Cloudy")
                            .resizable()
                            .frame(width: 85, height: 80)
                        Text("")
                            .font(.subheadline)
                        Text("Cloudy")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    
                    Spacer()
                    // Adjust spacing between elements
                    VStack(alignment: .center,spacing: 15) {
                        Image("Humidity")
                        Text("\(String(format: "%.2f", humidity)) %")
                            .font(.subheadline)
                        Text("Humidity")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    
                    
                    
                }
                //.padding()//end of 2nd HStack
                //3rd row
                HStack{
                    // Adjust spacing between elements
                    VStack(alignment: .center,spacing: 15) {
                        Image("Visibility")
                        
                        Text("\(String(format: "%.2f", visibility)) mi")
                            .font(.subheadline)
                        Text("Visibility")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    //.padding(.horizontal, 20)
                    Spacer()
                    // Adjust spacing between elements
                    VStack(alignment: .center,spacing: 15) {
                        Image("CloudCover")
                        Text("\(String(format: "%.2f", cloudCover)) %")
                            .font(.subheadline)
                        Text("Cloud Cover")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    Spacer()
                    
                    // Adjust spacing between elements
                    VStack(alignment: .center,spacing: 15) {
                        Image("UVIndex")
                        Text("\(String(format: "%.2f", uvIndex))")
                            .font(.subheadline)
                        Text("UV Index")
                            .font(.subheadline)
                        //.font(.system(size: 29, weight: .bold, design: .default))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10) // A rounded rectangle background
                            .fill(Color.white.opacity(0.4)) // Semi-transparent background
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Border overlay
                            .stroke(Color.white, lineWidth: 2) // White border
                    )
                    
                    
                    
                }
               // .padding()//end of 3rd HStack
            }
            
        }//}
    }
}
/*
#Preview {
    TodayView()
}*/
