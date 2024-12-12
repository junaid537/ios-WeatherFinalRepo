//
//  FrontView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 25/11/24.
//
/*
import SwiftUI
import Combine

struct FrontView: View {
    @StateObject private var locationManager = LocationAutocompleteManager()
    @State private var searchText = ""
    @Binding var selectedLocation: String
    //@StateObject private var viewModel = LocationSearchViewModel()

    let items = ["Minneapolis", "Minnetonka", "Minneola", "Minnehaha", "Chicago", "New York", "Los Angeles", "San Francisco", "Houston", "Dallas"]
    
    var body: some View {
        //NavigationStack {
            ZStack{
                // Background image
                Image("App_background")
                    .resizable()
                //.scaledToFill()
                    .ignoresSafeArea()
                
                //Spacer()
                // Main content
                Spacer()
                VStack() {
                    NavigationLink(destination: TabsView(), label: {
                        HStack {
                            Image("Mostly Clear")
                            VStack(alignment: .leading) {
                                Text("80°F")
                                    .font(.title)
                                    .foregroundColor(.black)
                                Text("Cloudy")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                Text(self.locationChosen)
                                    .font(.system(size: 29, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.4)) // Semi-transparent background
                                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding(.horizontal, 20)
                    })
                    
                    // Parameters View
                    HStack(spacing: 14) {
                        ParametersView(metric: "Humidity", metricImageName: "Humidity", value: "89%")
                        ParametersView(metric: "Wind Speed", metricImageName: "WindSpeed", value: "15 mph")
                        ParametersView(metric: "Visibility", metricImageName: "Visibility", value: "9.94 mi")
                        ParametersView(metric: "Pressure", metricImageName: "Pressure", value: "29.92 inHg")
                    }
                    .padding(.horizontal, 10)
                    
                    // Static Table View
                    StaticTableView()
                }
                .padding(.top, 50) // Add padding between the dropdown and the main content
            }
            .padding(.top, 0) // Ensure content is pushed down and aligns with the white background
        }
    }
    //}


#Preview {
    FrontView(selectedLocation: .constant(""))
}
*/
import SwiftUI
import Combine

struct FrontView: View {
    //let sunriseSunsetData: [(String, Int, String,String)]
    
    @StateObject private var locationManager = LocationAutocompleteManager()
    @State private var searchText = ""
    @Binding var selectedLocation: String//
    @Binding var selectedCity:String//
    @Binding var selectedState:String//
    @Binding var humidity: Double//
    @Binding var windSpeed: Double//
    @Binding var visibility: Double//
    @Binding var pressure: Double//
    @Binding var cloudCover: Double//
    
    @Binding var uvIndex: Double//
    @Binding var temperature: Double//
    @Binding var weatherCode: Double//
    @Binding var favouriteButton: Bool//
    @Binding var weatherDataThirdSubview: [(startTime: String, weatherCode: Double, sunriseTime: String, sunsetTime: String)]
    @Binding var areaRangeData: [(startTime: String, minTemperature: Double,maxTemperature: Double)]//
    @Binding var precipitationProbability: Double
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                NavigationLinkView(
                    selectedLocation: $selectedLocation,
                    favouriteButton: $favouriteButton,
                    selectedCity: $selectedCity,
                    selectedState: $selectedState,
                    humidity: $humidity,
                    temperature: $temperature,
                    weatherCode: $weatherCode,
                    areaRangeData: $areaRangeData,
                    uvIndex: $uvIndex,
                    cloudCover: $cloudCover,
                    visibility: $visibility,
                    pressure: $pressure,
                    windSpeed: $windSpeed,
                    precipitationProbability: $precipitationProbability
                )
                    //.offset(y: -30)
                .padding(.bottom, 20)
                ParameterSection(humidity: $humidity, windSpeed: $windSpeed, visibility: $visibility, pressure: $pressure)
                    .padding(.bottom, 20)
                    //.offset(y: -40)
                
                TrialView(weatherDataThirdSubview: $weatherDataThirdSubview)
                    //.offset(y: -50)
            }
            .padding(.top, 35)
        }
        .padding(.top, 0)
    }
}

// Subviews
struct BackgroundView: View {
    var body: some View {
        Image("App_background")
            .resizable()
            .ignoresSafeArea()
    }
}

struct NavigationLinkView: View {
    //var locationChosen: String
    
    @Binding var selectedLocation: String
    @Binding var favouriteButton: Bool
    @Binding var selectedCity:String
    @Binding var selectedState:String
    @Binding var humidity: Double //receiving
    @Binding var temperature: Double
    @Binding var weatherCode: Double
    @Binding var areaRangeData: [(startTime: String, minTemperature: Double,maxTemperature: Double)]
    @Binding var uvIndex: Double
    @Binding var cloudCover: Double
    @Binding var visibility: Double
    @Binding var pressure: Double
    @Binding var windSpeed: Double
    @Binding var precipitationProbability: Double
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
    
    var body: some View {
        
        if(favouriteButton){
            HStack {
                    Spacer() // Push PlusView to the rightmost part
                    PlusView(selectedCity: $selectedCity, selectedState: $selectedState)
                        .transition(.slide) // Optional: Add transition effect
            }
            .offset(y: -10)
        }
        
        NavigationLink(destination: TabsView(humidity: $humidity,temperature:$temperature,weatherCode: $weatherCode,areaRangeData: $areaRangeData,uvIndex: $uvIndex,cloudCover: $cloudCover,visibility:$visibility, pressure:$pressure, windSpeed: $windSpeed, precipitationProbability: $precipitationProbability,selectedCity: $selectedCity)) {
            HStack {
                let weatherDescription = keyValueMap[String(Int(weatherCode))] ?? "Unknown Weather"
                //Image("\(keyValueMap["\(weatherCode)"])")
                Image(weatherDescription)
                VStack(alignment: .leading) {
                    Text("\(String(format: "%.2f", temperature))°F")
                        .font(.title)
                        .foregroundColor(.black)
                    Text(weatherDescription)
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Text(firstPartOf(selectedLocation))
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
            .offset(y: favouriteButton ? -20 : 0)
        }
    }
    func firstPartOf(_ text: String) -> String {
        if text.isEmpty {
            return "Los Angeles" // Default value
        }
        return text.split(separator: ",").first.map(String.init) ?? text
    }
}

struct ParameterSection: View {
    @Binding var humidity: Double
    @Binding var windSpeed: Double
    @Binding var visibility: Double
    @Binding var pressure: Double
    var body: some View {
        HStack(spacing: 14) {
            ParametersView(metric: "Humidity", metricImageName: "Humidity", value:"\(humidity)%")
            ParametersView(metric: "Wind Speed", metricImageName: "WindSpeed", value: "\(windSpeed) mph")
            ParametersView(metric: "Visibility", metricImageName: "Visibility", value: "\(visibility) mi")
            ParametersView(metric: "Pressure", metricImageName: "Pressure", value: "\(pressure) inHg")
        }
        .padding(.horizontal, 10)
    }
}
#Preview {
   
   
   /* FrontView(selectedLocation: .constant("Default Location"),humidity: .constant(0),windSpeed: .constant(0),visibility: .constant(0),pressure: .constant(0),weatherCode: .constant(0),uvIndex: .constant(0),temperature: .constant(0),cloudCover: .constant(0),favouriteButton: .constant(false),selectedCity: .constant("Los Angeles"),selectedState: .constant("California"), weatherDataThirdSubview: .constant([
        (startTime: "2024-12-11T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-11T14:39:00Z", sunsetTime: "2024-12-11T00:54:00Z"),
        (startTime: "2024-12-12T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-12T14:39:00Z", sunsetTime: "2024-12-12T00:54:00Z"),
        (startTime: "2024-12-13T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-13T14:40:00Z", sunsetTime: "2024-12-13T00:54:00Z"),
        (startTime: "2024-12-14T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-14T14:41:00Z", sunsetTime: "2024-12-14T00:55:00Z"),
        (startTime: "2024-12-15T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-15T14:41:00Z", sunsetTime: "2024-12-15T00:55:00Z"),
        (startTime: "2024-12-16T06:00:00-08:00", weatherCode: 1100, sunriseTime: "2024-12-16T14:42:00Z", sunsetTime: "2024-12-16T00:55:00Z")
    ]),
              areaRangeData: .constant([
                      (startTime: "2024-12-11T06:00:00-08:00",minTemperature: 15.3, maxTemperature: 25.5 ),
                      (startTime: "2024-12-12T06:00:00-08:00",minTemperature: 18.5, maxTemperature: 28.0),
                      (startTime: "2024-12-13T06:00:00-08:00",minTemperature: 20.0, maxTemperature: 30.2),
                      (startTime: "2024-12-14T06:00:00-08:00",minTemperature: 17.6, maxTemperature: 27.8)
                  ])
    )*/
    FrontView(
        selectedLocation: .constant("Default Location"),
        selectedCity: .constant("Los Angeles"),
        selectedState: .constant("California"),
        humidity: .constant(0),
        windSpeed: .constant(0),
        visibility: .constant(0),
        pressure: .constant(0),
        cloudCover: .constant(0),
        uvIndex: .constant(0),
        temperature: .constant(0),
        weatherCode: .constant(0),
        favouriteButton: .constant(false),
        weatherDataThirdSubview: .constant([
            (startTime: "2024-12-11T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-11T14:39:00Z", sunsetTime: "2024-12-11T00:54:00Z"),
            (startTime: "2024-12-12T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-12T14:39:00Z", sunsetTime: "2024-12-12T00:54:00Z"),
            (startTime: "2024-12-13T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-13T14:40:00Z", sunsetTime: "2024-12-13T00:54:00Z"),
            (startTime: "2024-12-14T06:00:00-08:00", weatherCode: 1001, sunriseTime: "2024-12-14T14:41:00Z", sunsetTime: "2024-12-14T00:55:00Z"),
            (startTime: "2024-12-15T06:00:00-08:00", weatherCode: 1000, sunriseTime: "2024-12-15T14:41:00Z", sunsetTime: "2024-12-15T00:55:00Z"),
            (startTime: "2024-12-16T06:00:00-08:00", weatherCode: 1100, sunriseTime: "2024-12-16T14:42:00Z", sunsetTime: "2024-12-16T00:55:00Z")
        ]),
        areaRangeData: .constant([
            (startTime: "2024-12-11T06:00:00-08:00", minTemperature: 15.3, maxTemperature: 25.5),
            (startTime: "2024-12-12T06:00:00-08:00", minTemperature: 18.5, maxTemperature: 28.0),
            (startTime: "2024-12-13T06:00:00-08:00", minTemperature: 20.0, maxTemperature: 30.2),
            (startTime: "2024-12-14T06:00:00-08:00", minTemperature: 17.6, maxTemperature: 27.8)
        ]),
        precipitationProbability: .constant(0)
    )

}



