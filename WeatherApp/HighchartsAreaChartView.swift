//
//  HighchartsAreaChartView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 08/12/24.
//

//
//  ContentView.swift
//  HCSwiftUIDemo
//
//  Created by Highsoft AS on 22/09/2022.
//

import SwiftUI
import Highcharts
/*
struct HighchartsBasicChartView: View {
    var body: some View {
        VStack {
            Text("Highcharts Example")
                .font(.headline)
                .padding()

            HighchartsChartView()
                .frame(height: 300)
                .padding()
        }
    }
}

struct HighchartsChartView: UIViewRepresentable {
    func makeUIView(context: Context) -> HIChartView {
        let chartView = HIChartView()
        chartView.plugins = ["series-label"]
        chartView.options = createChartOptions()
        return chartView
    }

    func updateUIView(_ uiView: HIChartView, context: Context) {
        uiView.options = createChartOptions()
        uiView.redraw()
    }

    func createChartOptions() -> HIOptions {
        let options = HIOptions()

        // Chart configuration
        let chart = HIChart()
        chart.type = "line"
        options.chart = chart

        // Title
        let title = HITitle()
        title.text = "Monthly Temperature"
        options.title = title

        // X-axis
        let xAxis = HIXAxis()
        xAxis.categories = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        options.xAxis = [xAxis]

        // Y-axis
        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = "Temperature (°F)"
        options.yAxis = [yAxis]

        // Series data
        let series = HISeries()
        series.name = "Temperature"
        series.data = [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
        options.series = [series]

        return options
    }
}

struct HighchartsAreaChartView: View {
    var body: some View {
        HighchartsBasicChartView()
            .padding()
    }
}

#Preview {
    HighchartsAreaChartView()
}
*/
/*
import SwiftUI
import Highcharts

struct HighchartsAreaChartView: View {
    var body: some View {
        VStack {
            Text("15-Day Temperature Trend")
                .font(.headline)
                .padding()

            HighchartsChartView()
                .frame(height: 300)
                .padding()
        }
    }
}

struct HighchartsChartView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> HIChartView {
        let chartView = HIChartView()
        chartView.plugins = ["series-label"]
        chartView.options = createChartOptions()
        return chartView
    }
    
    func updateUIView(_ uiView: HIChartView, context: Context) {
        uiView.options = createChartOptions()
        uiView.redraw()
    }
    
    func createChartOptions() -> HIOptions {
        let options = HIOptions()

        // Chart configuration
        let chart = HIChart()
        chart.type = "area" // Area chart type
        options.chart = chart

        // Title
        let title = HITitle()
        title.text = "Minimum and Maximum Temperature"
        options.title = title

        // X-axis - next 15 days including today
        let xAxis = HIXAxis()
        xAxis.categories = generateDateLabels()
        options.xAxis = [xAxis]

        // Y-axis
        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = "Temperature (°F)"
        options.yAxis = [yAxis]

        // Series data - min and max temperatures for each day
        let minTempSeries = HISeries()
        minTempSeries.name = "Min Temperature"
        minTempSeries.data = generateTemperatureData(isMax: false)

        let maxTempSeries = HISeries()
        maxTempSeries.name = "Max Temperature"
        maxTempSeries.data = generateTemperatureData(isMax: true)

        options.series = [minTempSeries, maxTempSeries]

        return options
    }
    
    // Function to generate date labels for the next 15 days
    func generateDateLabels() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        var dates: [String] = []
        for i in 0..<15 {
            let date = Calendar.current.date(byAdding: .day, value: i, to: Date())!
            dates.append(formatter.string(from: date))
        }
        return dates
    }

    // Function to generate random temperature data
    func generateTemperatureData(isMax: Bool) -> [NSNumber] {
        var temperatures: [NSNumber] = []
        for _ in 0..<15 {
            let baseTemp = isMax ? Double.random(in: 80...100) : Double.random(in: 60...80)
            temperatures.append(NSNumber(value: baseTemp))
        }
        return temperatures
    }
}



#Preview{
    HighchartsAreaChartView()
}

*/


import SwiftUI
import Highcharts
struct HighchartsAreaChartView: View {
    var dataReceived: [ChartData] // Array of your data model objects
    var body: some View {
        VStack {
            Text("Temperature Ranges (Min, Max) VStack")
                .font(.headline)
                .padding()

            HighchartsChartView(dataReceived: dataReceived)
                .frame(height: 300)
                .padding()
        }
    }
}

struct HighchartsChartView: UIViewRepresentable {
    var dataReceived: [ChartData] // Array of your data model objects
    
    func makeUIView(context: Context) -> HIChartView {
        let chartView = HIChartView()
        chartView.plugins = ["series-label"]
        chartView.options = createChartOptions(dataReceived: dataReceived)
        return chartView
    }
    
    func updateUIView(_ uiView: HIChartView, context: Context) {
        uiView.options = createChartOptions(dataReceived: dataReceived)
        uiView.redraw()
    }
    
    func createChartOptions(dataReceived: [ChartData]) -> HIOptions {
        let options = HIOptions()

        // Chart configuration
        let chart = HIChart()
        chart.type = "arearange" // Area range chart type
        //chart.zooming = HIChartZooming()
        chart.zooming?.type = "x"
        chart.scrollablePlotArea = HIScrollablePlotArea()
        chart.scrollablePlotArea?.minWidth = 600
        chart.scrollablePlotArea?.scrollPositionX = 1
        options.chart = chart

        // Title
        let title = HITitle()
        title.text = "Temperature Ranges (Min, Max)"
        //title.style = HIStyle(color: "#000000", fontWeight: "bold", fontSize: "30px")
        options.title = title

        // X-axis configuration
        let xAxis = HIXAxis()
        xAxis.type = "datetime"
        xAxis.accessibility = HIAccessibility()
        xAxis.accessibility?.rangeDescription = "Range: Oct 11th 2024 to Oct 16 2024."
        //xAxis.crosshair = true
        options.xAxis = [xAxis]

        // Y-axis configuration
        let yAxis = HIYAxis()
        //yAxis.title = HITitle(text: nil)
        options.yAxis = [yAxis]

        // Tooltip configuration
        let tooltip = HITooltip()
        tooltip.shared = true
        tooltip.valueSuffix = "°F"
        tooltip.xDateFormat = "%A, %b %e"
        options.tooltip = tooltip

        // Legend configuration
        let legend = HILegend()
        legend.enabled = false
        options.legend = legend

        // Prepare data for the series
        let result = prepareChartData(dataReceived: dataReceived)

        // Series configuration
        let series = HISeries()
        series.type = "arearange"
       
        series.data = result

        // Gradient color for the area chart
        let gradientColor = HIColor(hexValue: "#f5a82d")
        let fillColor = HIColor(hexValue: "#87CEEB")

        // Set the color and markers for the series
        let color = HIColor()
        //color.linearGradient = HILinearGradient(x1: 0, x2: 0, y1: 0, y2: 1)
        //color.stops = [
           // [0, gradientColor],
         //   [1, fillColor]
       // ]
        series.color = color

        let marker = HIMarker()
        marker.enabled = true
        marker.radius = 5
        marker.fillColor = fillColor
        marker.lineColor = gradientColor
        marker.lineWidth = 1
        series.marker = marker

        options.series = [series]

        return options
    }
    
    // Function to prepare the data
    func prepareChartData(dataReceived: [ChartData]) -> [Any] {
        var result: [[Any]] = []
        
        // Convert ISO dates to UTC timestamps and prepare data array
        for i in 0..<min(6, dataReceived.count) {
            let isoDate = dataReceived[i].startTime
            let utcTimestamp = convertToUTC(isoDate: isoDate)
            let minTemp = dataReceived[i].values.temperatureMin
            let maxTemp = dataReceived[i].values.temperatureMax
            result.append([utcTimestamp, minTemp, maxTemp])
        }
        
        return result
    }
    
    // Function to convert ISO date to UTC timestamp
    func convertToUTC(isoDate: String) -> Double {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: isoDate) {
            return date.timeIntervalSince1970 * 1000 // Convert to milliseconds
        }
        return 0
    }
}

// Data models for the received data
struct ChartData {
    var startTime: String
    var values: TemperatureValues
}

struct TemperatureValues {
    var temperatureMin: Double
    var temperatureMax: Double
}

#Preview {
    HighchartsAreaChartView(dataReceived: [
        ChartData(startTime: "2024-12-01T00:00:00Z", values: TemperatureValues(temperatureMin: 60, temperatureMax: 75)),
        ChartData(startTime: "2024-12-02T00:00:00Z", values: TemperatureValues(temperatureMin: 62, temperatureMax: 78)),
        ChartData(startTime: "2024-12-03T00:00:00Z", values: TemperatureValues(temperatureMin: 63, temperatureMax: 80)),
        ChartData(startTime: "2024-12-04T00:00:00Z", values: TemperatureValues(temperatureMin: 65, temperatureMax: 82)),
        ChartData(startTime: "2024-12-05T00:00:00Z", values: TemperatureValues(temperatureMin: 64, temperatureMax: 79)),
        ChartData(startTime: "2024-12-06T00:00:00Z", values: TemperatureValues(temperatureMin: 66, temperatureMax: 81))
    ])
}


