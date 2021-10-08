//
//  OpenWeatherAPIService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/7/21.
//

import Foundation
import CoreLocation

class OpenWeatherAPIService: OpenWeatherAPIServiceProtocol {
    private let apiKey = "2204acb6f0028d27a12476dcb0b6ac80"
    
    func fetchWeatherData(from coordinates: CLLocationCoordinate2D, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        let url = URL(string: "htts://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)&units=metric")
        
        fetchWeatherData(from: url, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func fetchWeatherData(for cityName: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        let urlSafeCityName = cityName.toURLSafe()
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(urlSafeCityName)&appid=\(apiKey)&units=metric")
        
        fetchWeatherData(from: url, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    private func fetchWeatherData(from url: URL?, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        guard let url = url else {
            Self.runOnMainThread {
                onFailure?("Bad URL", "Invalid URL created for OpenWeatherAPI request!")
            }
            return
        }
        
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            Self.runOnMainThread {
                onFailure?("Error fetching data", error.localizedDescription)
            }
            return
        }
        
        let response: OpenWeatherAPIResponse
        do {
            response = try JSONDecoder().decode(OpenWeatherAPIResponse.self, from: data)
        } catch {
            Self.runOnMainThread {
                onFailure?("Error parsing JSON response", error.localizedDescription)
            }
            return
        }
        
        Self.runOnMainThread {
            onSuccess(response)
        }
    }
    
    private static func runOnMainThread(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }
}
