//
//  OptionalWeatherInfoView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct OptionalWeatherInfoView: View {
    var name: String
    var value: Float
    var unit: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(name)
                .fontWeight(.regular)
                .font(Font.system(size: 20))
                .layoutPriority(1)
            
            Text("\(formattedValue) \(unit)")
                .fontWeight(.medium)
                .font(Font.system(size: 25))
                .layoutPriority(1)
        }.foregroundColor(Color.white)
    }
    
    var formattedValue: String {
        return NumberFormatter.weatherDataFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

struct OptionalWeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalWeatherInfoView(name: "Humidity", value: 0.79, unit: "%")
            .background(Color.blue)
    }
}
