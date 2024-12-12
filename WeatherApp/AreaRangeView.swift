//
//  AreaRangeView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 12/12/24.
//



/*

import SwiftUI
import Highcharts

struct HighchartsView: UIViewRepresentable {
    var days: [String]
    var minTemps: [Double]
    var maxTemps: [Double]

    @MainActor
    func makeUIView(context: Context) -> HIChartView {
        let chartView = HIChartView()
        chartView.options = createChartOptions()
        return chartView
    }

    @MainActor
    func updateUIView(_ uiView: HIChartView, context: Context) {
        uiView.options = createChartOptions()
    }

    private func createChartOptions() -> HIOptions {
        let options = HIOptions()

        let chart = HIChart()
        chart.type = "line"
        options.chart = chart

        let title = HITitle()
        title.text = "7-Day Temperature Forecast"
        options.title = title

        let xAxis = HIXAxis()
        xAxis.categories = days
        xAxis.title = HITitle()
        xAxis.title.text = "Days"
        options.xAxis = [xAxis]

        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = "Temperature (°C)"
        options.yAxis = [yAxis]

        let minSeries = HISeries()
        minSeries.name = "Min Temperature"
        minSeries.data = minTemps.map { NSNumber(value: $0) }

        let maxSeries = HISeries()
        maxSeries.name = "Max Temperature"
        maxSeries.data = maxTemps.map { NSNumber(value: $0) }

        options.series = [minSeries, maxSeries]

        return options
    }
}

struct AreaRangeView: View {
    let days = ["88/99", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    let minTemps = [5.0, 7.0, 6.5, 8.0, 10.0, 12.0, 11.0]
    let maxTemps = [15.0, 17.0, 16.5, 18.0, 20.0, 22.0, 21.0]

    var body: some View {
        VStack {
            Text("Weather Forecast")
                .font(.headline)
                .padding()
            HighchartsView(days: days, minTemps: minTemps, maxTemps: maxTemps)
                .frame(height: 300)
                .padding()
        }
    }
}

#Preview {
    AreaRangeView()
}
*/


import SwiftUI
import Highcharts

struct HighchartsView: UIViewRepresentable {
    var days: [String]
    var minTemps: [Double]
    var maxTemps: [Double]

    @MainActor
    func makeUIView(context: Context) -> HIChartView {
        let chartView = HIChartView()
        chartView.options = createChartOptions()
        return chartView
    }

    @MainActor
    func updateUIView(_ uiView: HIChartView, context: Context) {
        uiView.options = createChartOptions()
    }

    private func createChartOptions() -> HIOptions {
        let options = HIOptions()

        let chart = HIChart()
        chart.type = "line"
        options.chart = chart

        let title = HITitle()
        title.text = "Temperature Variation By Day"
        options.title = title

        let xAxis = HIXAxis()
        xAxis.categories = days
        xAxis.title = HITitle()
        xAxis.title.text = "Days"
        options.xAxis = [xAxis]

        let yAxis = HIYAxis()
        yAxis.title = HITitle()
        yAxis.title.text = "Temperature (°F)"
        options.yAxis = [yAxis]

        let minSeries = HISeries()
        minSeries.name = "Min Temperature"
        minSeries.data = minTemps.map { NSNumber(value: $0) }

        let maxSeries = HISeries()
        maxSeries.name = "Max Temperature"
        maxSeries.data = maxTemps.map { NSNumber(value: $0) }

        // Create smooth arearange data
        let midIndex = days.count / 2
        var arearangeData: [[Any]] = []

        for i in 0..<days.count {
            if i == midIndex {
                // Add midpoint transition
                let midLower = minTemps[i]
                let midUpper = maxTemps[i]
                arearangeData.append([i, midLower, midUpper])
            }
            /*
            // First half: Upper is max, Lower is min
            if i < midIndex {
                arearangeData.append([i, minTemps[i], maxTemps[i]])
            }

            // Second half: Upper is min, Lower is max
            if i >= midIndex {
                arearangeData.append([i, maxTemps[i], minTemps[i]])
            }*/
        }

        let areaRangeSeries = HIArearange()
        areaRangeSeries.name = "Shaded Area"
        areaRangeSeries.data = arearangeData
        areaRangeSeries.color = HIColor(linearGradient: [
            "x1": 0, "y1": 0, "x2": 0, "y2": 1
        ], stops: [
            [0.0, "rgba(68, 170, 213, 0.5)"], // Top gradient color
            [1.0, "rgba(0, 0, 0, 0.1)"]       // Bottom gradient color
        ])
        areaRangeSeries.enableMouseTracking = false

        options.series = [minSeries, maxSeries, areaRangeSeries]

        return options
    }
}

struct AreaRangeView: View {
    @Binding var areaRangeData: [(startTime: String, minTemperature: Double,maxTemperature: Double)]
    var days: [String] = ["0","1","2","3","4","5","6"]
    /*var days: [String] {
            areaRangeData.map { $0.startTime }
        }*/
        var minTemps: [Double] {
            areaRangeData.map { $0.minTemperature }
        }
        var maxTemps: [Double] {
            areaRangeData.map { $0.maxTemperature }
        }
    var body: some View {
        VStack {
            HighchartsView(days: days, minTemps: minTemps, maxTemps: maxTemps)
                .frame(height: 300)
                .padding()
        }
    }
}

#Preview {
    AreaRangeView(areaRangeData: .constant([
        (startTime: "2024-12-11T06:00:00-08:00",minTemperature: 15.3, maxTemperature: 25.5 ),
        (startTime: "2024-12-12T06:00:00-08:00",minTemperature: 18.5, maxTemperature: 28.0),
        (startTime: "2024-12-13T06:00:00-08:00",minTemperature: 20.0, maxTemperature: 30.2),
        (startTime: "2024-12-14T06:00:00-08:00",minTemperature: 17.6, maxTemperature: 27.8)
    ]))
}


