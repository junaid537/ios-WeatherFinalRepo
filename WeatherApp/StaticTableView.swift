//
//  StaticTableView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 22/11/24.
//



import SwiftUI

struct TableViewRow: Identifiable {
    let id = UUID()
    let date: String
    let weather: String
    let temp: String
    let sunrise: String
    let sunset: String
}

struct StaticTableView: View {
    @State private var tabularData: [IntervalValues] = []
    // Sample data
    let tableData: [TableViewRow] = [
        TableViewRow(date: "11/21/2024", weather: "Sunny", temp: "75°F", sunrise: "6:30 AM", sunset: "5:30 PM"),
        TableViewRow(date: "11/22/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:31 AM", sunset: "5:29 PM"),
        
    ]
    
    var body: some View {
        VStack {
                List(tableData){ row in
                    HStack{
                       
                        Text(row.weather)
                        Spacer()
                        Text(row.temp)
                        Spacer()
                        Text(row.temp)
                        Spacer()
                        Text(row.temp)
                    }
                }
                .listStyle(PlainListStyle())
            
            .onAppear{
                //getSelectedRow()
                //getC()
            }
            
        }
        .background(Color.white.opacity(0.5)) 
        .listRowBackground(Color.clear)
    }
    
    /*func getC(){
        NetworkManager.shared.getCoordinates { result in
            switch result {
            case .success(let location):
                print("Latitude: \(location.lat), Longitude: \(location.lng)")
                getSelectedRow(lat: location.lat, lng: location.lng)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    func getSelectedRow(lat: Double, lng: Double) {
        NetworkManager.shared.getTomorrowData {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    print("Success time")
                    print(data)
                    //self.tabularData = data
                    //print("Updated tabularData: \(self.tabularData)")
                case .failure(let error):
                    print("Helllo error ")
                    print(error)
            }
            }
                
        }
    }*/
}

#Preview {
    StaticTableView()
}


/*
import SwiftUI

struct TableViewRow: Identifiable {
    let id = UUID()
    let date: String
    let weather: String
    let temp: String
    let sunrise: String
    let sunset: String
}

struct StaticTableView: View {
    // Sample data
    let tableData: [TableViewRow] = [
        TableViewRow(date: "11/21/2024", weather: "Sunny", temp: "75°F", sunrise: "6:30 AM", sunset: "5:30 PM"),
        TableViewRow(date: "11/22/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:31 AM", sunset: "5:29 PM"),
        TableViewRow(date: "11/22/2024", weather: "Rain", temp: "60°F", sunrise: "6:32 AM", sunset: "5:28 PM"),
        TableViewRow(date: "11/22/2024", weather: "Windy", temp: "65°F", sunrise: "6:33 AM", sunset: "5:27 PM"),
        TableViewRow(date: "11/22/2024", weather: "Sunny", temp: "72°F", sunrise: "6:34 AM", sunset: "5:26 PM"),
        TableViewRow(date: "11/22/2024", weather: "Sunny", temp: "72°F", sunrise: "6:34 AM", sunset: "5:26 PM"),
        TableViewRow(date: "11/22/2024", weather: "Sunny", temp: "72°F", sunrise: "6:34 AM", sunset: "5:26 PM")
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(tableData) { row in
                    HStack(alignment: .center) {
                        Text(row.date)
                            .frame(width: 100, alignment: .leading) // Fixed width for date
                            .lineLimit(1) // Ensure date stays on one line
                            .minimumScaleFactor(0.8) // Scale down text if necessary
                        
                        Text(row.weather)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(row.temp)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(row.sunrise)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(row.sunset)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.vertical, 8) // Add vertical padding for readability
                    .background(Color.blue.opacity(0.2)) // Light blue background
                    
                }
            }
            .listStyle(PlainListStyle()) // Simplify list styling
        }
       
    }
}

#Preview {
    StaticTableView()
}

*/
/*
import SwiftUI

struct TableViewRow: Identifiable {
    let id = UUID()
    let date: String
    let weather: String
    let temp: String
    let sunrise: String
    let sunset: String
}

struct StaticTableView: View {
    // Sample data
    let tableData: [TableViewRow] = [
        TableViewRow(date: "11/21/2024", weather: "Sunny", temp: "75°F", sunrise: "6:30 AM", sunset: "5:30 PM"),
        TableViewRow(date: "11/22/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:31 AM", sunset: "5:29 PM"),
        TableViewRow(date: "11/23/2024", weather: "Rain", temp: "60°F", sunrise: "6:32 AM", sunset: "5:28 PM"),
        TableViewRow(date: "11/24/2024", weather: "Windy", temp: "65°F", sunrise: "6:33 AM", sunset: "5:27 PM"),
        TableViewRow(date: "11/25/2024", weather: "Sunny", temp: "72°F", sunrise: "6:34 AM", sunset: "5:26 PM"),
        TableViewRow(date: "11/26/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:35 AM", sunset: "5:25 PM"),
        TableViewRow(date: "11/27/2024", weather: "Rainy", temp: "63°F", sunrise: "6:36 AM", sunset: "5:24 PM")
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0) { // No spacing between rows
                    ForEach(tableData.prefix(5), id: \.id) { row in
                        VStack(spacing: 0) {
                            HStack(alignment: .center) {
                                Text(row.date)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fixedSize(horizontal: true, vertical: false) // Prevents truncation and line breaking
                                
                                Text(row.weather)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Text(row.temp)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Text(row.sunrise)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                Text(row.sunset)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .padding()
                            .background(Color.blue.opacity(0.2)) // Light blue background
                            
                            Divider() // Grey horizontal line
                                .background(Color.gray.opacity(0.5)) // Adjust opacity for desired effect
                        }
                    }
                }
            }
             // Restrict height for approximately 5 rows
        }
        .padding()
    }
}

#Preview {
    StaticTableView()
}

*/
/*
import SwiftUI

struct TableViewRow: Identifiable {
    let id = UUID()
    let date: String
    let weather: String
    let temp: String
    let sunrise: String
    let sunset: String
}

struct StaticTableView: View {
    // Sample data
    let tableData: [TableViewRow] = [
        TableViewRow(date: "11/21/2024", weather: "Sunny", temp: "75°F", sunrise: "6:30 AM", sunset: "5:30 PM"),
        TableViewRow(date: "11/22/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:31 AM", sunset: "5:29 PM"),
        TableViewRow(date: "11/23/2024", weather: "Rain", temp: "60°F", sunrise: "6:32 AM", sunset: "5:28 PM"),
        TableViewRow(date: "11/24/2024", weather: "Windy", temp: "65°F", sunrise: "6:33 AM", sunset: "5:27 PM"),
        TableViewRow(date: "11/25/2024", weather: "Sunny", temp: "72°F", sunrise: "6:34 AM", sunset: "5:26 PM"),
        TableViewRow(date: "11/26/2024", weather: "Cloudy", temp: "68°F", sunrise: "6:35 AM", sunset: "5:25 PM"),
        TableViewRow(date: "11/27/2024", weather: "Rainy", temp: "63°F", sunrise: "6:36 AM", sunset: "5:24 PM")
    ]
    
    var body: some View {
        Table(tableData) {
            TableColumn("Date") { row in
                Text(row.date)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            TableColumn("Weather") { row in
                Text(row.weather)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            TableColumn("Temp") { row in
                Text(row.temp)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            TableColumn("Sunrise") { row in
                Text(row.sunrise)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            TableColumn("Sunset") { row in
                Text(row.sunset)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(height: 250) // Restrict height to display approximately 5 rows
        .background(Color.gray.opacity(0.1)) // Light background for the table
        .padding()
    }
}

#Preview {
    StaticTableView()
}
*/
