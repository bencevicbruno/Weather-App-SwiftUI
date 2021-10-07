//
//  TemperatureInfoView.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import SwiftUI

struct TemperatureInfoView: View {
    var name: String
    var value: Float
    var useCelsius: Bool
    
    var body: some View {
        VStack {
            Text(name)
            
            if useCelsius {
                Text("\(value, specifier: "%.1f") C")
            } else {
                Text("\(value.toFahrenheit(), specifier: "%.1f") F")
            }
            
        }
        .font(Font.system(size: 30))
    }
}

struct TemperatureInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureInfoView(name: "min", value: 14.5, useCelsius: true)
    }
}
