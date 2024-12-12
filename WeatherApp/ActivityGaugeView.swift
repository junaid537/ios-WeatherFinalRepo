//
//  ActivityGaugeView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 09/12/24.
//

import SwiftUI
import Highcharts

struct ActivityGaugeView: UIViewRepresentable {
    @Binding var humidity: Double
    @Binding var cloudCover: Double
    @Binding var precipitationProbability: Double

    func makeUIView(context: Context) -> HIChartView {
        let chartView = HIChartView()
        chartView.plugins = ["solid-gauge"]
        chartView.options = createGaugeChartOptions()
        return chartView
    }

    func updateUIView(_ uiView: HIChartView, context: Context) {
        // Update options if needed
    }

    private func createGaugeChartOptions() -> HIOptions {
        let options = HIOptions()

        // Chart Configuration
        let chart = HIChart()
        chart.type = "solidgauge"
        options.chart = chart

        // Title
        let title = HITitle()
        title.text = "Activity Gauge"
        options.title = title

        // Pane Configuration (background segments)
        let pane = HIPane()
        pane.startAngle = 0
        pane.endAngle = 360

        // Set concentric background layers with colors as required
        let background1 = HIBackground() // Outermost Circle: Green
        background1.outerRadius = "112%"
        background1.innerRadius = "88%"
        background1.backgroundColor = HIColor(rgba: 0, green: 255, blue: 0, alpha: 0.35) // Green
        background1.borderWidth = 0

        let background2 = HIBackground() // Middle Circle: Blue
        background2.outerRadius = "87%"
        background2.innerRadius = "63%"
        background2.backgroundColor = HIColor(rgba: 0, green: 0, blue: 255, alpha: 0.35) // Blue
        background2.borderWidth = 0

        let background3 = HIBackground() // Innermost Circle: Red
        background3.outerRadius = "62%"
        background3.innerRadius = "38%"
        background3.backgroundColor = HIColor(rgba: 255, green: 0, blue: 0, alpha: 0.35) // Red
        background3.borderWidth = 0

        // Assign the backgrounds to the pane
        pane.background = [background1, background2, background3]
        options.pane = [pane]

        // Y-Axis Configuration
        let yAxis = HIYAxis()
        yAxis.min = 0
        yAxis.max = 100
        yAxis.lineWidth = 0
        yAxis.tickPositions = [] // No tick marks
        options.yAxis = [yAxis]

        // Plot Options
        let plotOptions = HIPlotOptions()
        plotOptions.solidgauge = HISolidgauge()
        plotOptions.solidgauge.linecap = "round"
        plotOptions.solidgauge.rounded = true
        options.plotOptions = plotOptions

        // Series Data for "Humidity", "Cloud Cover", "Precipitation Probability"
        let moveSeries = HISolidgauge()
        moveSeries.name = "Humidity"
        moveSeries.data = [
            createBrightDataPoint(value: humidity, radius: "112%", innerRadius: "88%", color: HIColor(rgba: 0, green: 255, blue: 0, alpha: 1)),
            createDimDataPoint(value: 100 - humidity, radius: "112%", innerRadius: "88%", color: HIColor(rgba: 0, green: 255, blue: 0, alpha: 0.2))
        ]

        let exerciseSeries = HISolidgauge()
        exerciseSeries.name = "Cloud Cover"
        exerciseSeries.data = [
            createBrightDataPoint(value: cloudCover, radius: "87%", innerRadius: "63%", color: HIColor(rgba: 0, green: 0, blue: 255, alpha: 1)),
            createDimDataPoint(value: 100 - cloudCover, radius: "87%", innerRadius: "63%", color: HIColor(rgba: 0, green: 0, blue: 255, alpha: 0.2))
        ]

        let standSeries = HISolidgauge()
        standSeries.name = "Precipitation Probability"
        standSeries.data = [
            createBrightDataPoint(value: precipitationProbability, radius: "62%", innerRadius: "38%", color: HIColor(rgba: 255, green: 0, blue: 0, alpha: 1)),
            createDimDataPoint(value: 100 - precipitationProbability, radius: "62%", innerRadius: "38%", color: HIColor(rgba: 255, green: 0, blue: 0, alpha: 0.2))
        ]

        options.series = [moveSeries, exerciseSeries, standSeries]

        return options
    }

    private func createBrightDataPoint(value: Double, radius: String, innerRadius: String, color: HIColor) -> HIData {
        let data = HIData()
        data.y = NSNumber(value: value)
        data.radius = radius
        data.innerRadius = innerRadius
        data.color = color
        return data
    }

    private func createDimDataPoint(value: Double, radius: String, innerRadius: String, color: HIColor) -> HIData {
        let data = HIData()
        data.y = NSNumber(value: value)
        data.radius = radius
        data.innerRadius = innerRadius
        data.color = color
        return data
    }
}

#Preview {
    ActivityGaugeView(humidity: .constant(0), cloudCover: .constant(0), precipitationProbability: .constant(0))
}

