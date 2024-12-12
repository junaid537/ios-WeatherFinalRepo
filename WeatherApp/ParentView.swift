//
//  ParentView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 24/11/24.
//

/*

 */
/*
import SwiftUI

struct ParentView: View {
    struct TableViewRow: Identifiable {
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
        
    ]
    
    var body: some View {
        ZStack {
            Image("App_background")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 20) { // Adjust spacing between elements
                
                NavigationLink(destination: TabsView(), label:  {
                    HStack {
                        Image("Mostly Clear")
                        VStack(alignment: .leading) {
                            Text("80°F")
                                .font(.title)
                                .foregroundColor(.black)
                            Text("Cloudy")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            Text("Los Angeles")
                                .font(.system(size: 29, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        }
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
                    .padding(.horizontal, 20)
                })
                // Horizontal padding for screen edges
                
                // Parameters View
                HStack(spacing: 14) {
                    ParametersView(metric: "Humidity", metricImageName: "Humidity", value: "89%")
                    ParametersView(metric: "Wind Speed", metricImageName: "WindSpeed", value: "15 mph")
                    ParametersView(metric: "Visibility", metricImageName: "Visibility", value: "9.94 mi")
                    ParametersView(metric: "Pressure", metricImageName: "Pressure", value: "29.92 inHg")
                }
                .padding(.horizontal, 10) // Adjust horizontal padding for balance
                
                // Static Table View
                
//                List(tableData){ row in
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text(row.date)
//                                .font(.caption)
//                                .foregroundColor(.secondary)
//                        }
//                        VStack(alignment: .leading){
//                            Text(row.weather)
//                                .font(.caption)
//                                .foregroundColor(.secondary)
//                        }
//                        VStack(alignment: .leading){
//                            Text(row.temp)
//                                .font(.caption)
//                                .foregroundColor(.secondary)
//                        }
//                        
//                        VStack(alignment: .leading){
//                            Text(row.temp)
//                                .font(.caption)
//                                .foregroundColor(.secondary)
//                        }
//                    }
//                    .padding()
//                    .background(Color.white.opacity(0.5))
//                    .listRowBackground(Color.clear)
//                    
//                }
//                .listStyle(PlainListStyle())
                
                List(tableData.indices, id: \.self) { index in
                    VStack(spacing: 0) { // Ensures no spacing between rows
                        HStack {
                            Text(tableData[index].weather)
                            Spacer()
                            Text(tableData[index].temp)
                            Spacer()
                            Text(tableData[index].weather)
                            Spacer()
                            Text(tableData[index].temp)
                        }
                        .padding()
                        .background(Color.white.opacity(0.5)) // 50% opaque background for each row
                        
        

                        if index < tableData.count - 1 { // Add Divider only between rows
                            Divider()
                        }
                        
                        HStack {
                            Text(tableData[index].weather)
                            Spacer()
                            Text(tableData[index].temp)
                            Spacer()
                            Text(tableData[index].weather)
                            Spacer()
                            Text(tableData[index].temp)
                        }
                        .padding()
                        .background(Color.white.opacity(0.5)) // 50% opaque background for each row
                        
                        
                    }
                    .listRowBackground(Color.clear) // Remove default background
                }
                .listStyle(PlainListStyle()) // Minimalist list style
                

                
            }
            //.padding(.top, 50) // Add padding to push content down
            
        }
            
        
    }
}

#Preview {
    ParentView()
}
*/
