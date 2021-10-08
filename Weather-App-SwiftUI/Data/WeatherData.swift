//
//  WeatherData.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 9/27/21.
//

import Foundation

class WeatherData: Codable {
    let weatherIcon: String
    let currentTemperature: Int
    let location: String
    let minimalTemperature: Float
    let maximalTemperature: Float
    let humidity: Float
    let pressure: Float
    let windSpeed: Float
    
    init(weatherIcon: String, currentTemperature: Int, location: String, minimalTemperature: Float, maximalTemperature: Float, humidity: Float, pressure: Float, windSpeed: Float) {
        self.weatherIcon = weatherIcon
        self.currentTemperature = currentTemperature
        self.location = location
        self.minimalTemperature = minimalTemperature
        self.maximalTemperature = maximalTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.windSpeed = windSpeed
    }
}

extension WeatherData {
    static var test: WeatherData {
        WeatherData(weatherIcon: "sun.max", currentTemperature: 21, location: "London", minimalTemperature: 14.5, maximalTemperature: 31.2, humidity: 0.79, pressure: 1016.7, windSpeed: 4.34)
    }
    
    static var empty: WeatherData {
        WeatherData(weatherIcon: "seal", currentTemperature: 0, location: "unknown", minimalTemperature: 0, maximalTemperature: 0, humidity: 0, pressure: 0, windSpeed: 0)
    }
}

extension WeatherData {
    convenience init(response: OpenWeatherAPIResponse) {
        self.init(weatherIcon: Self.getConditionFrom(id: response.weather.first?.id ?? 0),
                  currentTemperature: Int(response.main.temp),
                  location: response.name,
                  minimalTemperature: response.main.temp_min,
                  maximalTemperature: response.main.temp_max,
                  humidity: response.main.humidity / 100,
                  pressure: response.main.pressure,
                  windSpeed: response.wind.speed)
    }
    
    private static func getConditionFrom(id: Int) -> String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
