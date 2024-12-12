////
////  ExamplView.swift
////  WeatherApp
////
////  Created by Junaid Iqbal Khalidi on 25/11/24.
////
//
//import SwiftUI
//import Combine
///*
//struct ExampleView: View {
//    @State private var searchText: String = ""
//        let items = ["Minneapolis", "Minnetonka", "Minneola", "Minnehaha"]
//
//    var body: some View {
//        VStack {
//            // Displaying search results
//            List(locationManager.results, id: \.id) { prediction in
//                Text(prediction.description)
//                    .onTapGesture {
//                        // Handle selection (e.g., navigate or fetch details)
//                        print("Selected: \(prediction.description)")
//                    }
//            }
//            .searchable(text: $searchText, prompt: "Enter city name...")
//            .onChange(of: searchText) { newValue in
//                locationManager.query = newValue // Trigger search in manager
//            }
//            .listStyle(.plain) // Simplify the dropdown list style
//            .frame(maxHeight: 300) // Restrict the dropdown's height for better control
//            .background(Color.white) // Ensure dropdown list background is white
//            .cornerRadius(10)
//            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a shadow
//            .padding(.horizontal, 16) // Center the search box horizontally
//            
//            //Spacer()
//        }
//        Spacer()
//        }
//        
//    }
//
//#Preview {
//    ExampleView()
//}
// 
// 
// */
///*
//import SwiftUI
//import Combine
//
//
//
//struct ExamplView: View {
//    @StateObject private var locationManager = LocationAutocompleteManager()
//    @State private var searchText = ""
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                // Background image
//                Image("App_background")
//                    .resizable()
//                    .ignoresSafeArea()
//
//                VStack {
//                    // Searchable input box
//                    TextField("Enter city name...", text: $searchText)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(.horizontal, 8)
//                        .onChange(of: searchText) { newValue in
//                            locationManager.query = newValue
//                        }
//
//                    // Dropdown for suggestions
//                    if !locationManager.results.isEmpty {
//                        VStack(alignment: .leading, spacing: 0) {
//                            ForEach(locationManager.results, id: \.description) { result in
//                                Button(action: {
//                                    // Handle selection
//                                    searchText = result.description
//                                    locationManager.results = [] // Clear results to hide dropdown
//                                }) {
//                                    Text(result.description)
//                                        .padding()
//                                        .frame(maxWidth: .infinity, alignment: .leading)
//                                }
//                                .foregroundColor(.black)
//                                .background(Color.white)
//                            }
//                        }
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.white.opacity(0.4)) // Semi-transparent background
//                                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2) // Shadow effect
//                        )
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.white, lineWidth: 2) // Border effect
//                        )
//                        .padding(.horizontal, 8)
//                        .transition(.opacity)
//                    }
//
//                    Spacer()
//                }
//                .padding()
//            }
//        }
//    }
//}
//
//class LocationAutocompleteManager: ObservableObject {
//    @Published var query: String = "" {
//        didSet {
//            handleSearchFragment(query)
//        }
//    }
//    @Published var results: [Prediction] = []
//
//    func handleSearchFragment(_ fragment: String) {
//        guard !fragment.isEmpty else {
//            results = []
//            return
//        }
//
//        // Simulated results for demonstration
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.results = [
//                Prediction(description: "Los Angeles, CA", placeID: "1"),
//                Prediction(description: "Las Vegas, NV", placeID: "2"),
//                Prediction(description: "New York, NY", placeID: "3")
//            ]
//        }
//    }
//}
//
//struct Prediction: Identifiable {
//    let id = UUID()
//    let description: String
//    let placeID: String
//}
//
//#Preview {
//    ExamplView()
//}
//
//*/
///*
// 
// Stack(spacing: 0) {
//     // White background containing the input box
//     Color.white
//         .frame(height: 139) // Adjust the height of the white background
//         .edgesIgnoringSafeArea(.top)
// }
// 
// VStack(spacing: 0) {
//     // Input box and dropdown list
//     VStack {
//         List(items, id: \.self) { item in
//             Text(item)
//         }
//         .searchable(text: $searchText, prompt: "Enter city name..")
//         .listStyle(.plain) // Simplify the dropdown list style
//         .frame(maxHeight: 0) // Restrict the dropdown's height for better control
//         .background(Color.white) // Ensure dropdown list background is white
//         .cornerRadius(10)
//         .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a shadow
//         .scrollIndicators(.visible) // Always show the scroll indicator when scrolling
//         .zIndex(1) // Ensure the dropdown is on top of other elements
//     }
//     
//     // Main content
//     VStack(spacing: 20) {
//         NavigationLink(destination: TabsView(), label: {
//             HStack {
//                 Image("Mostly Clear")
//                 VStack(alignment: .leading) {
//                     Text("80°F")
//                         .font(.title)
//                         .foregroundColor(.black)
//                     Text("Cloudy")
//                         .font(.subheadline)
//                         .foregroundColor(.black)
//                     Text("Los Angeles")
//                         .font(.system(size: 29, weight: .bold, design: .default))
//                         .foregroundColor(.black)
//                 }
//             }
//             .padding()
//             .background(
//                 RoundedRectangle(cornerRadius: 10)
//                     .fill(Color.white.opacity(0.4)) // Semi-transparent background
//                     .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 2)
//             )
//             .overlay(
//                 RoundedRectangle(cornerRadius: 10)
//                     .stroke(Color.white, lineWidth: 2)
//             )
//             .padding(.horizontal, 20)
//         })
//         
//         // Parameters View
//         HStack(spacing: 14) {
//             ParametersView(metric: "Humidity", metricImageName: "Humidity", value: "89%")
//             ParametersView(metric: "Wind Speed", metricImageName: "WindSpeed", value: "15 mph")
//             ParametersView(metric: "Visibility", metricImageName: "Visibility", value: "9.94 mi")
//             ParametersView(metric: "Pressure", metricImageName: "Pressure", value: "29.92 inHg")
//         }
//         .padding(.horizontal, 10)
//         
//         // Static Table View
//         //StaticTableView()
//     }
//     .padding(.top, 20) // Add padding between the dropdown and the main content
// }
// .padding(.top, 0)
// */
////Bestest code-------------------------------------------------------------------------------
//
//import SwiftUI
//import Combine
//
//struct ExamplView: View {
//    @StateObject private var locationManager = LocationAutocompleteManager()
//    @State private var searchText = ""
//    //@State private var searchText = ""
//    @State private var selectedLocation: String? = nil
//    @State private var latitude: Double?
//    @State private var longitude: Double?
//    @State private var weatherData: APIResponse?
//    //@StateObject private var viewModel = LocationSearchViewModel()
//    
//    let items = ["Minneapolis", "Minnetonka", "Minneola", "Minnehaha", "Chicago", "New York", "Los Angeles", "San Francisco", "Houston", "Dallas"]
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                //FrontView(selectedLocation: $selectedLocation,humidity: $humidity )
//                VStack {
//                    // White background containing the search bar
//                    Color.white
//                        .frame(height: 139) // Adjust height for the search bar container
//                        .edgesIgnoringSafeArea(.top)
//                        .overlay(
//                            VStack {
//                                // Use SwiftUI's searchable modifier
//                                List(locationManager.results, id: \.id) { prediction in
//                                    Text(prediction.description)
//                                        .onTapGesture {
//                                            // Handle selection (e.g., fetch coordinates)
//                                            //.self.selectedLocation = prediction.description
//                                            print("Selected: \(prediction.description)")
//                                            self.selectedLocation = prediction.description
//                                            getC()
//                                        }
//                                }
//                                .searchable(text: $searchText, prompt: "Enter city name...")
//                                .onChange(of: searchText) { newValue in
//                                    locationManager.query = newValue // Trigger search in manager
//                                }
//                                .listStyle(.plain) // Simplify the dropdown list style
//                                .frame(maxHeight: searchText.isEmpty ? 0 : 250) // Show list only when there is text
//                                .background(Color.white) // Ensure dropdown list background is white
//                                .cornerRadius(10)
//                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a shadow
//                                .padding(.horizontal, 16) // Center the search box horizontally
//                                .zIndex(5)
//                                .scrollContentBackground(.hidden) // Allow for scrollable content
//                            }
//                        )
//                        .zIndex(1) // Ensures the search bar and its results are on top of other views
//                    
//                    Spacer() // Pushes the rest of the content below
//                    
//                    // Main content (add your other views here)
//                }
//            }
//        }
//        /*func fetchTomorrowData() {
//            guard let lat = latitude, let lon = longitude else { return }
//            
//            NetworkManager.shared.getTomorrowData(latitude: lat, longitude: lon) { result in
//                switch result {
//                case .success(let data):
//                    self.weatherData = data
//                case .failure(let error):
//                    print("Error fetching tomorrow's data: \(error)")
//                }
//            }
//        }*/
//        
//        
//    }
////    func getC(){
////        NetworkManager.shared.getCoordinates(selectedLocation: selectedLocation) { result in
////                switch result {
////                case .success(let location):
////                    print("Latitude: \(location.lat), Longitude: \(location.lng)")
////                    getSelectedRow(lat: location.lat, lng: location.lng)
////                case .failure(let error):
////                    print("Error: \(error)")
////                }
////            }
////        }
////        func getSelectedRow(lat: Double, lng: Double) {
////            NetworkManager.shared.getTomorrowData {result in
////                DispatchQueue.main.async {
////                    switch result {
////                    case .success(let data):
////                        print("Success time")
////                        print(data)
////                        //self.tabularData = data
////                        //print("Updated tabularData: \(self.tabularData)")
////                    case .failure(let error):
////                        print("Helllo error ")
////                        print(error)
////                }
////                }
////                    
////            }
////        }
//
//}
//
//
//#Preview {
//    ExamplView()
//}
//
//
