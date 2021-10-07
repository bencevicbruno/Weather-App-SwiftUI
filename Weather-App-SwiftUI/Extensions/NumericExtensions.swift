//
//  NumericExtensions.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 9/28/21.
//

import Foundation

extension Int {
    func toFahrenheit() -> Int {
        return Int(Float(self) * 8 / 5 + 32)
    }
}

extension Float {
    func toFahrenheit() -> Float {
        return self * 8 / 5 + 32
    }
}
