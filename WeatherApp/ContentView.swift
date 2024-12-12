//
//  ContentView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 22/11/24.
/*
import SwiftUI
import Combine

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var suggestions: [String] = [] // List of suggestions
    @State private var showSuggestions: Bool = false
    private var debounceTimer: AnyCancellable? // Timer for debouncing search
    
    var body: some View {
        ZStack {
            Image("App_background")
                .resizable()
                .ignoresSafeArea()
            VStack{
            HStack{
                Image("Mostly Clear")
                VStack{
                    Text("80°F")
                    Text("Cloudy")
                    Text("Los Angeles")
                        .font(.system(size: 29,weight: .bold,design:.default))
                    
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
            .padding(.horizontal, 20) // Horizontal padding for screen edges
            .offset(y: -UIScreen.main.bounds.height * 0.25)
            
            
            HStack(spacing: 14){
                ParametersView(metric:"Humidity",metricImageName:"Humidity",value:"89%")
                ParametersView(metric:"Wind Speed",metricImageName:"WindSpeed",value:"89%")
                ParametersView(metric:"Visibility",metricImageName:"Visibility",value:"9.94 mi")
                ParametersView(metric:"Pressure",metricImageName:"Pressure",value:"29.92 inHg")
                
            }
                StaticTableView();
        }
            
            
        }
    }
}

#Preview {
    ContentView()
}
*/
/*
import SwiftUI
import Combine

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var suggestions: [String] = [] // List of suggestions
    @State private var showSuggestions: Bool = false
    let items = ["Minneapolis", "Minnetonka", "Minneola", "Minnehaha"]

    private var debounceTimer: AnyCancellable? // Timer for debouncing search
    
    var body: some View {
        NavigationStack {
            //NavbarView()
              //  .frame(height: 27) // Set the height of NavbarView to 60 (or any height you prefer)
                //.padding(.top, 0)
            
            ZStack {
                List(items, id: \.self) { item in
                    Text(item)
                }
                .searchable(text: $searchText, prompt: "Enter city name..") // Search bar
                .padding(.top, 20) 
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
                    
                    StaticTableView()
                    
                }
                //.padding(.top, 50) // Add padding to push content down
                
            }
        }
    }
}

#Preview {
    ContentView()
}
*/

/*
struct ContentView: View {
    @StateObject private var locationManager = LocationAutocompleteManager()
    @State private var searchText = ""
    //@StateObject private var viewModel = LocationSearchViewModel()

    let items = ["Minneapolis", "Minnetonka", "Minneola", "Minnehaha", "Chicago", "New York", "Los Angeles", "San Francisco", "Houston", "Dallas"]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // Background image
                Image("App_background")
                    .resizable()
                    //.scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // White background containing the input box
                    Color.white
                        .frame(height: 139) // Adjust the height of the white background
                        .edgesIgnoringSafeArea(.top)
                }
                Spacer()
                
                VStack(spacing: 0) {
                    Spacer()
                    // Input box and dropdown list
                    /*VStack {
                        List(items, id: \.self) { item in
                            Text(item)
                        }
                        .searchable(text: $searchText, prompt: "Enter city name..")
                        .listStyle(.plain) // Simplify the dropdown list style
                        .frame(maxHeight: 0) // Restrict the dropdown's height for better control
                        .background(Color.white) // Ensure dropdown list background is white
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a shadow
                        .scrollIndicators(.visible) // Always show the scroll indicator when scrolling
                        .zIndex(1) // Ensure the dropdown is on top of other elements
                        .padding(.horizontal, 16) // Center the search box horizontally
                        .offset(y: -145)
                    }*/
                    VStack {
                        // Displaying search results
                        List(locationManager.results, id: \.id) { prediction in
                            Text(prediction.description)
                                .onTapGesture {
                                    // Handle selection (e.g., navigate or fetch details)
                                    print("Selected: \(prediction.description)")
                                }
                        }
                        .searchable(text: $searchText, prompt: "Enter city name...")
                        .onChange(of: searchText) { newValue in
                            locationManager.query = newValue // Trigger search in manager
                        }
                        .listStyle(.plain) // Simplify the dropdown list style
                        //.frame(maxHeight: 100) // Restrict the dropdown's height for better control
                        .background(Color.white) // Ensure dropdown list background is white
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a shadow
                        .padding(.horizontal, 16) // Center the search box horizontally
                        .zIndex(5)
                        //Spacer()
                    }
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
                                    Text("Los Angeles")
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
                    .padding(.top, 20) // Add padding between the dropdown and the main content
                }
                .padding(.top, 0) // Ensure content is pushed down and aligns with the white background
            }
        }
    }
}

#Preview {
    ContentView()
}
*/
import SwiftUI
import Combine
import SwiftSpinner

struct ContentView: View{
    @State private var showLaunchScreen = true
    @State private var currentIndex: Int = 0
    private let favouriteViews = Array(0..<5).map { FavouriteView(index: $0) }
    var body: some View {
        //WindowGroup {
                    if showLaunchScreen {
                        LaunchScreenView()
                            .onAppear {
                                // Simulate loading delay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    showLaunchScreen = false
                                }
                            }
                    } else {
                        MainContentView()
                        /*VStack {
                                    TabView(selection: $currentIndex) {
                                        // DefaultView is the first screen
                                        MainContentView()
                                            .tag(0)

                                        // FavouriteView instances after DefaultView
                                        ForEach(0..<3, id: \.self) { index in
                                            favouriteViews[index]
                                                .tag(index + 1) // Shift index by 1 to allow DefaultView as the first tab
                                                .padding()
                                        }
                                    }
                                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Disable default dots
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                                    // Custom dots
                                    HStack(spacing: 8) {
                                        ForEach(0..<(favouriteViews.count + 1), id: \.self) { index in
                                            Circle()
                                                .fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.5))
                                                .frame(width: 10, height: 10)
                                        }
                                    }
                                    .padding(.bottom, 10)
                                }*/
                    }
                //}
    }
}
struct MainContentView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var locationManager = LocationAutocompleteManager()
    @State private var searchText = ""
    @State private var isSearchActive = true
    @State private var favouriteButton: Bool = false
     //startTime,weatherCode,sunsetTime,sunsetTime
    //@State private var searchText = ""
    @State private var selectedLocation: String = "Los Angeles"
    @State private var selectedCity: String = "Los Angeles"
    @State private var selectedState: String = "California"
    @State private var latitude: Double = 34.0522
    @State private var longitude: Double = -118.2437
    @State private var humidity: Double = 0
    @State private var windSpeed: Double = 12.02
    @State private var visibility: Double = 9.94
    @State private var pressure: Double = 29.92
    @State private var cloudCover: Double = 100
    @State private var uvIndex: Double = 2
    @State private var temperature: Double = 0
    @State private var precipitationProbability: Double = 0
    @State private var c: Double = 0
    @State private var weatherCode: Double = 0
    
    @State private var weatherData: APIResponse?
    @State private var intervals: [Interval] = []
    @State private var weatherDataThirdSubview: [(startTime: String, weatherCode: Double, sunriseTime: String, sunsetTime: String)] = []
    //@State private var AreaRangeData: [(startTime: String, minTemperature: Double, maxTemperature: Double)] = []
    @State private var areaRangeData: [(startTime: String, minTemperature: Double, maxTemperature: Double)] = []
    //@State private var favoriteCities: [City] = []
    //@State private var currentPageIndex: Int = 0
    //@State private var sunriseSunsetData: [(String,Int,String, String)] = []
    //@State private var locationChosen:String=""
    //@StateObject private var viewModel = LocationSearchViewModel()
    
    let items = ["Minneapolis", "Minnetonka", "Minneola", "Minnehaha", "Chicago", "New York", "Los Angeles", "San Francisco", "Houston", "Dallas"]
    let stateAbbreviations: [String: String] = [
        "AL": "Alabama",
        "AK": "Alaska",
        "AZ": "Arizona",
        "AR": "Arkansas",
        "CA": "California",
        "CO": "Colorado",
        "CT": "Connecticut",
        "DE": "Delaware",
        "DC": "District Of Columbia",
        "FL": "Florida",
        "GA": "Georgia",
        "HI": "Hawaii",
        "ID": "Idaho",
        "IL": "Illinois",
        "IN": "Indiana",
        "IA": "Iowa",
        "KS": "Kansas",
        "KY": "Kentucky",
        "LA": "Louisiana",
        "ME": "Maine",
        "MD": "Maryland",
        "MA": "Massachusetts",
        "MI": "Michigan",
        "MN": "Minnesota",
        "MS": "Mississippi",
        "MO": "Missouri",
        "MT": "Montana",
        "NE": "Nebraska",
        "NV": "Nevada",
        "NH": "New Hampshire",
        "NJ": "New Jersey",
        "NM": "New Mexico",
        "NY": "New York",
        "NC": "North Carolina",
        "ND": "North Dakota",
        "OH": "Ohio",
        "OK": "Oklahoma",
        "OR": "Oregon",
        "PA": "Pennsylvania",
        "RI": "Rhode Island",
        "SC": "South Carolina",
        "SD": "South Dakota",
        "TN": "Tennessee",
        "TX": "Texas",
        "UT": "Utah",
        "VT": "Vermont",
        "VA": "Virginia",
        "WA": "Washington",
        "WV": "West Virginia",
        "WI": "Wisconsin",
        "WY": "Wyoming"
    ]
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

    var body: some View {
        NavigationStack {
            ZStack {
                /*FrontView(selectedLocation: $selectedLocation,humidity: $humidity,windSpeed: $windSpeed,visibility: $visibility,pressure: $pressure,weatherCode:$weatherCode,uvIndex:$uvIndex,temperature:$temperature,cloudCover:$cloudCover,favouriteButton: $favouriteButton,selectedCity:$selectedCity,selectedState: $selectedState, weatherDataThirdSubview: $weatherDataThirdSubview,areaRangeData: $areaRangeData)*/
                FrontView(
                    selectedLocation: $selectedLocation,
                    selectedCity: $selectedCity,
                    selectedState: $selectedState,
                    humidity: $humidity,
                    windSpeed: $windSpeed,
                    visibility: $visibility,
                    pressure: $pressure,
                    cloudCover: $cloudCover,
                    uvIndex: $uvIndex,
                    temperature: $temperature,
                    weatherCode: $weatherCode,
                    favouriteButton: $favouriteButton,
                    weatherDataThirdSubview: $weatherDataThirdSubview,
                    areaRangeData: $areaRangeData,
                    precipitationProbability: $precipitationProbability
                )

                VStack {
                    // White background containing the search bar
                    Color.white
                        .frame(height: 139) // Adjust height for the search bar container
                        .edgesIgnoringSafeArea(.top)
                        .overlay(
                            VStack {
                                // Use SwiftUI's searchable modifier
                                if isSearchActive{
                                    List(locationManager.results, id: \.id) { prediction in
                                            Text(prediction.description)
                                            
                                                .onTapGesture {
                                                    handleTapGesture(prediction: prediction)
                                                    searchText = ""
                                                    locationManager.query = ""
                                                    isSearchActive = false
                                                    // Handle selection (e.g., fetch coordinates)
                                                    //.self.selectedLocation = prediction.description
                                                   /* print("Selected: \(prediction.description)")
                                                    self.selectedLocation = prediction.description
                                                    extractCityAndState(from: prediction.description)
                                                    self.searchText=prediction.description
                                                    getC()
                                                    //DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    // Hide the dropdown by clearing the query
                                                    locationManager.query = "" // This will remove the results
                                                    //}
                                                    isSearchActive = false
                                                    self.favouriteButton=true*/
                                                }
                                        
                                    }
                                    .background(Color(white: 1.0,opacity: 0.5))
                                    .searchable(text: $searchText, prompt: "Enter city name...")
                                    .onChange(of: searchText) { newValue in
                                        locationManager.query = newValue // Trigger search in manager
                                    }
                                
                                    .listStyle(.plain) // Simplify the dropdown list style
                                    .frame(maxHeight: searchText.isEmpty ? 0 : 250) // Show list only when there is text
                                    .background(Color(white: 0.5,opacity: 0.5)) // Ensure dropdown list background is white
                                    .cornerRadius(10)
//                                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a shadow
                                    .padding(.horizontal, 16) // Center the search box horizontally
                                    .zIndex(5)
                                    .scrollContentBackground(.hidden)
                                }
                                else{
                                    VStack{
                                        Text("");
                                    }
                                    .toolbar {
                                        // Leading button
                                        ToolbarItem(placement: .topBarLeading) {
                                            Button(action: {
                                                isSearchActive = true
                                                self.favouriteButton = false
                                                // Action for Weather button
                                                dismiss()
                                            }, label: {
                                                HStack {
                                                    Image(systemName: "chevron.left")
                                                    Text("Weather")
                                                }
                                                .foregroundColor(.blue) // Weather button text in blue
                                            })
                                        }
                                        
                                        // Title in the center
                                        ToolbarItem(placement: .principal) {
                                            Text(self.selectedCity)
                                                .font(.headline)
                                                .foregroundColor(.black) // Title in black
                                        }
                                        
                                        // Trailing button
                                        ToolbarItem(placement: .topBarTrailing) {
                                            Button(action: {
                                                print("hello twitter")
                                                shareOnTwitter()
                                                dismiss()
                                                /*let weatherDescription = keyValueMap[String(Int(weatherCode))] ?? "Unknown"
                                                let message = "The current Temperature at \(selectedCity), \(selectedState) is \(temperature)°F! The Weather conditions are \(weatherDescription)#CSCI571WeatherSearch"
                                                postToTwitter(with: message)*/
                                            }, label: {
                                                //Image("twitter-x") // Replace with the actual image you want to use
                                                Image(systemName: "square.and.arrow.up")
                                                //.renderingMode(.template) // Enables color tinting
                                                    //.foregroundColor(.blue)   // Changes icon color to blue
                                            })
                                        }
                                    }
                                    .toolbarBackground(Color.white, for: .navigationBar) // Toolbar background white
                                    .toolbarBackground(.visible, for: .navigationBar)
                                }
                                     // Allow for scrollable content
                                }
                        )
                        .zIndex(1) // Ensures the search bar and its results are on top of other views
                    
                    Spacer() // Pushes the rest of the content below
                    
                    // Main content (add your other views here)
                }//End of Vstack
            }// Zstack
        }//Nav Stack
        /*func fetchTomorrowData() {
            guard let lat = latitude, let lon = longitude else { return }
            
            NetworkManager.shared.getTomorrowData(latitude: lat, longitude: lon) { result in
                switch result {
                case .success(let data):
                    self.weatherData = data
                case .failure(let error):
                    print("Error fetching tomorrow's data: \(error)")
                }
            }
        }*/
        .onAppear {
                   // Fetch weather data for Los Angeles on the first page load
                   getSelectedRow(lati: latitude, lngi: longitude)
        }
          
    }
    func getC(){
        NetworkManager.shared.getCoordinates(selectedLocation: selectedLocation) { result in
                switch result {
                case .success(let location):
                    print("Latitude: \(location.lat), Longitude: \(location.lng)")
                    getSelectedRow(lati: location.lat, lngi: location.lng)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    
        func getSelectedRow(lati: Double, lngi: Double) {
            NetworkManager.shared.getTomorrowData(lat: lati, lng: lngi ) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        print("Success time")
                        //print(data)
                        print("humiid")
                        //print(data.data.timelines)
                        print(data.data.timelines?.first?.intervals?.first?.values?.humidity)
                        let hum = data.data.timelines?.first?.intervals?.first?.values?.humidity ?? 0
                        self.humidity = hum
                        self.temperature=data.data.timelines?.first?.intervals?.first?.values?.temperature ?? 75.67
                        self.windSpeed=data.data.timelines?.first?.intervals?.first?.values?.windSpeed ?? 12.02
                        self.visibility=data.data.timelines?.first?.intervals?.first?.values?.visibility ?? 9.94
                        self.pressure=data.data.timelines?.first?.intervals?.first?.values?.pressureSeaLevel ?? 29.92
                        self.weatherCode=data.data.timelines?.first?.intervals?.first?.values?.weatherCode ?? 1000
                        self.precipitationProbability=data.data.timelines?.first?.intervals?.first?.values?.precipitationProbability ?? 30
                        self.uvIndex=data.data.timelines?.first?.intervals?.first?.values?.uvIndex ?? 2
                        self.cloudCover=data.data.timelines?.first?.intervals?.first?.values?.cloudCover ?? 2
                        
                        /*if let timelines = data.data.timelines, let firstTimeline = timelines.first {
                            var extractedData: [(startTime: String, weatherCode: Double, sunriseTime: String, sunsetTime: String)] = []
                            //var graphOneData: [(startTime: String, minTemperature: Double, maxTemperature: Double)] = []
                            for timeline in timelines {
                                if let intervals = firstTimeline.intervals {
                                    for interval in intervals {
                                        // Extract the required values
                                        if let startTime = interval.startTime,
                                           let values = interval.values,
                                           let weatherCode = values.weatherCode,
                                           let sunriseTime = values.sunriseTime,
                                           let sunsetTime = values.sunsetTime {
                                            extractedData.append((startTime: startTime, weatherCode: weatherCode, sunriseTime: sunriseTime, sunsetTime: sunsetTime))
                                        }
                                    }
                                }
                            }
                            print(extractedData.count)
                            // Now `extractedData` contains the data for all intervals
                            // You can now assign this data to your state variable
                            self.weatherDataThirdSubview = extractedData // Assuming `weatherDataThirdSubview` is a @State or @Published variable
                            //print("Extracted Data: \(self.weatherDataThirdSubview)")
                            
                            //self.tabularData = data
                            //print("Updated tabularData: \(self.tabularData)")
                        }*/
                        /*if let firstTimeline = data.data.timelines?.first, let intervals = firstTimeline.intervals {
                                            var extractedData: [(startTime: String, weatherCode: Double, sunriseTime: String, sunsetTime: String)] = []

                                            for interval in intervals {
                                                if let startTime = interval.startTime,
                                                   let values = interval.values,
                                                   let weatherCode = values.weatherCode,
                                                   let sunriseTime = values.sunriseTime,
                                                   let sunsetTime = values.sunsetTime {
                                                    extractedData.append((startTime: startTime, weatherCode: weatherCode, sunriseTime: sunriseTime, sunsetTime: sunsetTime))
                                                }
                                            }

                                            print("Extracted Data Count: \(extractedData.count)")

                                            // Assign extracted data to the appropriate state variable
                                            self.weatherDataThirdSubview = extractedData
                                        } else {
                                            print("No intervals found in the first timeline.")
                                        } */
                        if let firstTimeline = data.data.timelines?.first,
                           let intervals = firstTimeline.intervals {
                            var extractedData: [(startTime: String, weatherCode: Double, sunriseTime: String, sunsetTime: String)] = []
                            var graphData: [(startTime: String,minTemperature: Double ,maxTemperature: Double)] = []

                            for interval in intervals {
                                if let startTime = interval.startTime,
                                   let values = interval.values,
                                   let weatherCode = values.weatherCode,
                                   let sunriseTime = values.sunriseTime,
                                   let sunsetTime = values.sunsetTime {
                                    extractedData.append((startTime: startTime, weatherCode: weatherCode, sunriseTime: sunriseTime, sunsetTime: sunsetTime))
                                }
                            }

                            for interval in intervals {
                                if let startTime = interval.startTime,
                                   let values = interval.values,
                                   let minTemperature = values.temperatureMin,
                                   let maxTemperature = values.temperatureMax {
                                    graphData.append((startTime: startTime, minTemperature: minTemperature, maxTemperature: maxTemperature))
                                }
                            }

                            print("Extracted Data Count: \(extractedData.count)")

                            // Assign extracted data to the appropriate state variable
                            self.weatherDataThirdSubview = extractedData
                            self.areaRangeData = graphData
                        } else {
                            print("No intervals found in the first timeline.")
                        }
                        //extractAreaRangeData(data)
                      
                    case .failure(let error):
                        print("Error occurred: \(error.localizedDescription)")
                    }
                    
                }
            }
        }
    
    func shareOnTwitter() {
        print("shareOnTwitter")
        // Debugging: Ensure all values are populated correctly
        print("Selected City: \(selectedCity)")
        print("Selected State: \(selectedState)")
        print("Temperature: \(temperature)")
        print("Weather Code: \(weatherCode)")

        // Compute the weather description
        let weatherDescription = keyValueMap[String(Int(weatherCode))] ?? "Unknown"
        print("Weather Description: \(weatherDescription)") // Debug this to ensure correctness

        // Create the tweet text
        let tweetText = "The current Temperature at \(selectedCity), \(selectedState) is \(temperature)°F! The Weather conditions are \(weatherDescription). #CSCI571WeatherSearch"
        print("Tweet Text: \(tweetText)") // Debug this to see the final tweet content

        // Encode the tweet text
        guard let encodedTweet = tweetText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Failed to encode tweet text")
            return
        }
        print("Encoded Tweet: \(encodedTweet)") // Debug to verify encoding

        // Construct the Twitter share URL
        guard let twitterURL = URL(string: "https://twitter.com/intent/tweet?text=\(encodedTweet)") else {
            print("Failed to construct Twitter URL")
            return
        }
        print("Twitter URL: \(twitterURL)") // Debug to ensure the URL is correct

        // Open the URL in Safari
        if UIApplication.shared.canOpenURL(twitterURL) {
            UIApplication.shared.open(twitterURL, options: [:]) { success in
                print("Twitter URL opened successfully: \(success)")
            }
        } else {
            print("Cannot open Twitter URL")
        }
    }

   /* func postToTwitter(with message: String) {
            // Ensure the message is properly encoded
            guard let encodedMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                print("Failed to encode the message")
                return
            }
            // Create the URL
            let urlString = "https://twitter.com/intent/tweet?text=\(encodedMessage)"
            print(urlString)
            if let url = URL(string: urlString) {
                
                UIApplication.shared.open(url)
            } else {
                print("Failed to create the URL")
            }
        }
    
    func shareOnTwitter() {
        var weatherDescription: String {
            keyValueMap[String(Int(weatherCode))] ?? "Unknown"
        }
          let tweetText = "The current Temperature at \(selectedCity), \(selectedState) is \(temperature)°F ! The Weather conditions are \(weatherDescription). #CSCI571Weather Search"
          let encodedTweet = tweetText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
          
          // Construct the Twitter share URL
          let twitterURL = URL(string: "https://twitter.com/intent/tweet?text=\(encodedTweet)")!
          
          // Open the URL in Safari
          if UIApplication.shared.canOpenURL(twitterURL) {
              UIApplication.shared.open(twitterURL, options: [:], completionHandler: nil)
          }
      }Main one*/
   /* func shareOnTwitter() {
        var weatherDescription: String {
            print("Weather code lookup: \(weatherCode)")
            return keyValueMap[String(Int(weatherCode))] ?? "Unknown"
        }
        
        print("Weather description resolved to: \(weatherDescription)")
        
        let tweetText = "The current Temperature at \(selectedCity), \(selectedState) is \(temperature)°F ! The Weather conditions are \(weatherDescription). #CSCI571Weather Search"
        
        let encodedTweet = tweetText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        print("Encoded Tweet: \(encodedTweet)")
        
        let twitterURL = URL(string: "https://twitter.com/intent/tweet?text=\(encodedTweet)")!
        
        if UIApplication.shared.canOpenURL(twitterURL) {
            UIApplication.shared.open(twitterURL, options: [:], completionHandler: nil)
        } else {
            print("Can't open Twitter URL")
        }
    }*/

    func formatDate(_ isoDateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MM/dd/yyyy"

        if let date = isoFormatter.date(from: isoDateString) {
            return outputFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
    private func extractCityAndState(from location: String) {
        let components = location.components(separatedBy: ",")
        
        if components.count >= 2 {
            self.selectedCity = components[0].trimmingCharacters(in: .whitespacesAndNewlines) // First word
            //self.selectedState = stateAbbreviations[components[1].trimmingCharacters(in: .whitespacesAndNewlines)] // Second word
            if let state = stateAbbreviations[components[1].trimmingCharacters(in: .whitespacesAndNewlines)] {
                self.selectedState = state
            } else {
                self.selectedState = "California" // Or handle the nil case appropriately
            }
        }
    }
    private func handleTapGesture(prediction: Prediction) {
            print("Selected: \(prediction.description)")
            self.selectedLocation = prediction.description
            extractCityAndState(from: prediction.description)
            self.searchText = prediction.description

            // Show the spinner
            SwiftSpinner.show("Loading data for \(prediction.description)...")
            
            // Simulate fetching coordinates
            DispatchQueue.global(qos: .background).async {
                getC() // Call your method here
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Adjust delay as per your API response time
                    SwiftSpinner.hide()
                    locationManager.query = "" // Clear the query to hide dropdown
                    self.isSearchActive = false
                    self.favouriteButton = true
                }
                self.isSearchActive = false
                //self.searchText = ""
                //self.selectedLocation=""
                
            }
        }

}


#Preview {
    ContentView()
}


//spinner
