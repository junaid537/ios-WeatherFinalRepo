//
//  PageControlView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 12/12/24.
//



import SwiftUI

struct PageControlWithDotsView: View {
    @AppStorage("currentPageIndex") private var currentPageIndex: Int = 0 // Persist the current page index using UserDefaults
    
    private let pages = [
        "Page 1: Welcome to SwiftUI",
        "Page 2: Learn about UIPageControl",
        "Page 3: Save your progress with UserDefaults"
    ]
    
    var body: some View {
        ZStack {
            Color.blue // Set the blue background color
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TabView(selection: $currentPageIndex) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        VStack {
                            Text(pages[index])
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Shows dots at the bottom of TabView
                //.frame(height: 400)
                
                //Spacer() // Push the dots to the bottom of the screen
            }
            .padding()
        }
    }
}


#Preview{
    PageControlWithDotsView()
}
/*
struct PageControlWithDotsView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlWithDotsView()
    }
}*/
