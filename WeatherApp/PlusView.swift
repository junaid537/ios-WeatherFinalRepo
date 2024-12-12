//
//  PlusView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 07/12/24.
//

/*
GET : https://nodeprojecthw3.wl.r.appspot.com/favourites
DELETE:https://nodeprojecthw3.wl.r.appspot.com/favourites?city=${encodeURIComponent(city)}&state=${encodeURIComponent(state)}
 POST :https://nodeprojecthw3.wl.r.appspot.com/favourites
 
*/

/*
import SwiftUI
struct PlusView: View {
    @State private var isPlus = true  // State to track the icon
    @State private var showToast = false  // Tracks whether the toast is visible
    @State private var toastMessage = ""
    var body: some View {
        ZStack {
                    VStack {
                        Button(action: {
                            // Toggle between "+" and "X"
                            isPlus.toggle()
                            
                            // Set the toast message based on the button state
                            toastMessage = isPlus ? "Switched to Plus!" : "Switched to Cross!"
                            
                            // Show the toast
                            withAnimation {
                                showToast = true
                            }
                            
                            // Hide the toast after 2 seconds
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showToast = false
                                }
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 50, height: 50)

                                Image(systemName: isPlus ? "plus" : "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20) // Size of the plus icon
                                        .foregroundColor(.black) // Black icon color
                                        .padding(20) // Padding inside the circle
                                        .background(Circle().fill(Color.white)) // White circular background
                                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }

                    // Toast message
                    if showToast {
                        VStack {
                            Spacer()  // Push the toast to the bottom
                            Text(toastMessage)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.bottom, 20)  // Add some space at the bottom
                        }
                        .transition(.opacity)  // Smooth fade-in and fade-out
                    }
                }
    }
}*/


import SwiftUI
import Alamofire
import Foundation
import Toast


// MARK: - Response Model
struct CityResponse: Decodable {
    let id: String
    let city: String
    let state: String
    let v: Int

    // Map `_id` to `id` and `__v` to `v`
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case city
        case state
        case v = "__v"
    }
}

struct PlusView: View {
    @State private var isPresentInAPI = false  // Tracks if the city is present in the API
    @State private var isPlus = true          // Tracks the button state
    @State private var cityName = "Los Angeles" // The city to check and toggle
    @Binding var selectedCity:String
    @Binding var selectedState:String
    var body: some View {
        VStack {
            if isPlus {
                // Render the + button
                Button(action: {
                    // Show the toast
                    self.showToast(message: "City \(selectedCity) added to favourites")
                    isPlus = false // Toggle to 'X'
                    
                    addCityToAPI(city: selectedCity, state: selectedState) // Make POST request
                }) {
                    buttonContent(icon: "plus")
                }
            } else {
                
                // Render the X button
                Button(action: {
                    self.showToast(message: "City \(selectedCity) removed from favourites")
                    isPlus = true // Toggle to '+'
                    removeCityFromAPI(city: selectedCity, state: selectedState ) // Make DELETE request
                }) {
                    buttonContent(icon: "xmark")
                }
            }
        }
        
        .onAppear {
            checkCityInAPI(city: selectedCity, state: selectedState) // Call GET request on load
        }
    }
    
    // MARK: - Button Content
    private func buttonContent(icon: String) -> some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 24, height: 24) // Smaller circle size
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14) // Smaller icon size
                .foregroundColor(.black) // Black icon color
        }
        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2) // Optional: Adjust shadow to match new size
    }
    
    private func showToast(message: String) {
            // Display Toast with the message at the bottom of the screen
            ToastManager.shared.isQueueEnabled = true // Enable queue for toast messages
            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(message, duration: 2.0, position: .bottom)
        }
    
    // MARK: - API Requests
    private func checkCityInAPI(city: String, state: String) {
        let url = "https://nodeprojecthw3.wl.r.appspot.com/favourites" // Replace with your GET API endpoint

        AF.request(url, method: .get)
            .validate() // Validate HTTP response
            .responseDecodable(of: [CityResponse].self) { response in
                switch response.result {
                case .success(let cityList):
                    // Check if both city and state exist in the list
                    isPresentInAPI = cityList.contains { $0.city == city && $0.state == state }
                    isPlus = !isPresentInAPI // Set initial button state
                case .failure(let error):
                    print("GET request failed: \(error.localizedDescription)")
                }
            }
    }

    
    private func addCityToAPI(city: String, state: String) {
        let url = "https://nodeprojecthw3.wl.r.appspot.com/favourites" // Replace with your POST API endpoint
        let parameters: [String: Any] = [
            "city": city,
            "state": state // Include the state parameter
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success:
                    print("City and state added successfully.")
                case .failure(let error):
                    print("POST request failed: \(error.localizedDescription)")
                }
            }
    }

    
    private func removeCityFromAPI(city: String, state: String) {
        //let url = "https://api.example.com/cities/\(city)" // Replace with your DELETE API endpoint
        let url = "https://nodeprojecthw3.wl.r.appspot.com/favourites?city=\(city)&state=\(state)"
        AF.request(url, method: .delete).responseJSON { response in
            switch response.result {
            case .success:
                print("City removed successfully.")
            case .failure(let error):
                print("DELETE request failed: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    PlusView(selectedCity: .constant("Los Angeles"),selectedState: .constant("California"))
}


