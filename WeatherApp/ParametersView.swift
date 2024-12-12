//
//  ParametersView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 22/11/24.
//
import SwiftUI

struct ParametersView: View {
    
    var metric : String
    var metricImageName : String
    var value: String
    
    var body: some View{
        VStack{
            Text(metric)
                .font(.system(size: 18,weight:.medium,design:.default))
            Image(metricImageName)
                .resizable()
                .frame(width: 70, height:80)
                
            Text(value)
        }
        
    }
}
