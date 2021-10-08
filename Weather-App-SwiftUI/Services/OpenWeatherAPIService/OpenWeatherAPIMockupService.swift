//
//  OpenWeatherAPIMockupService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/8/21.
//

import Foundation
import CoreLocation

class OpenWeatherAPIMockupService: OpenWeatherAPIServiceProtocol {
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        onSuccess(OpenWeatherAPIResponse.test)
    }
    
    func fetchWeatherData(for cityName: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        onSuccess(OpenWeatherAPIResponse.test)
    }
}
