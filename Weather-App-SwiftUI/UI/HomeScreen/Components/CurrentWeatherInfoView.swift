//
//  CurrentWeatherView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct CurrentWeatherViewInfo: View {
    let weatherIcon: String
    let currentTemperature: Int
    let useCelsius: Bool
    
    var body: some View {
        VStack(alignment: .trailing) {
            Image(systemName: weatherIcon)
                .resizable()
                .frame(width: 90, height: 90)
                .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.3))
            
            HStack {
                Text("\(useCelsius ? currentTemperature : currentTemperature.toFahrenheit())")
                    .font(Font.system(size: 70))
                    .fontWeight(.heavy)
                
                Text(useCelsius ? "°C" : "°F")
                    .font(Font.system(size: 80))
            }
        }
    }
}

struct CurrentWeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherViewInfo(weatherIcon: "sun.max", currentTemperature: 21, useCelsius: true)
    }
}
