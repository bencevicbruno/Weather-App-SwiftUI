//
//  FormatterExtensions.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import Foundation

extension NumberFormatter {
    static var weatherDataFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ""
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
}
