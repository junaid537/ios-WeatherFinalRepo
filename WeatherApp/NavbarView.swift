//
//  NavbarView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 24/11/24.
//
/*
import SwiftUI

struct NavbarView: View {
    var body: some View {
        NavigationStack {
            Text("NavbarView")
                .navigationTitle("NavbarView")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button(action:{
                            
                        },label:{
                            Text("Weather")
                        })
                    }
                    ToolbarItem(placement: .principal) { // Center placement for the title
                        Text("Los Angeles")
                            .font(.headline)
                            .fontWeight(.bold)// Adjust font style if needed
                                        }
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action:{
                            
                        },label:{
                            Image("twitter-x")
                                .renderingMode(.template)
                                .foregroundColor(.blue)
                        })
                    }
                }
        }
    }
}

#Preview {
    NavbarView()
}*/
import SwiftUI

struct NavbarView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
            // Navigation Stack on top of the blue background
            NavigationStack {
                //VStack {
                    

                    // Main content
                    /*Text("Main Content Goes Here")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding()

                    Spacer()*/
                //}
                //.navigationTitle("") // Set an empty title to prevent duplication in the navigation bar
                Text("")
                .toolbar {
                    // Leading button
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            // Action for Weather button
                            dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                            Text("Weather")
                                .foregroundColor(.blue) // Weather button text in blue
                        })
                    }
                    // Title in the center
                    ToolbarItem(placement: .principal) {
                        Text("Los Angeles")
                            .font(.headline)
                            .foregroundColor(.black) // Title in black
                    }
                    // Trailing button
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // Action for Twitter button
                        }, label: {
                            Image("twitter-x") // Replace with the actual image you want to use
                                .renderingMode(.template) // Enables color tinting
                                .foregroundColor(.blue)   // Changes icon color to blue
                        })
                    }
                }
                .toolbarBackground(.white, for: .navigationBar) // Sets the navigation bar background to whitee
                
            }
        }
    
}

#Preview {
    NavbarView()
}


