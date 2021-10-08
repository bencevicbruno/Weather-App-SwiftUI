//
//  OpenWeatherAPIServiceProtocol.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/8/21.
//

import Foundation
import CoreLocation

protocol OpenWeatherAPIServiceProtocol {
    typealias SuccessHandler = (OpenWeatherAPIResponse) -> Void
    typealias FailureHandler = (String, String) -> Void
    
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?)
    func fetchWeatherData(for cityName: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?)
}

extension OpenWeatherAPIServiceProtocol {
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        self.fetchWeatherData(from: coordinates, onSuccess: onSuccess, onFailure: nil)
    }
    
    func fetchWeatherData(for cityName: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        self.fetchWeatherData(for: cityName, onSuccess: onSuccess, onFailure: onFailure)
    }
}
