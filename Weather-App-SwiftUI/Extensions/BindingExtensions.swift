//
//  BindingExtensions.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import Foundation
import SwiftUI

extension Binding where Value == Bool {
    var opposite: Binding<Value> {
        Binding<Value>(
            get: {
                return !self.wrappedValue
            }, set: {
                self.wrappedValue = !$0
            }
        )
    }
}
