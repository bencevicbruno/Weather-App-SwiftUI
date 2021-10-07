//
//  OpenWeatherAPIService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/7/21.
//

import Foundation
import CoreLocation

struct WeatherDataResponse: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
    
    struct Weather: Codable {
        let id: Int
    }
    
    struct Main: Codable {
        let temp: Float
        let temp_min: Float
        let temp_max: Float
        let pressure: Float
        let humidity: Float
    }

    struct Wind: Codable {
        let speed: Float
    }
}

class OpenWeatherAPIService {
    private let apiKey = "2204acb6f0028d27a12476dcb0b6ac80"
    
    func getWeatherData(from coordinates: CLLocationCoordinate2D, errorNotifier: ((String, String?) -> Void)? = nil) -> WeatherDataResponse? {
        let url = URL(string: "htts://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)&units=metric")
        
        return getWeatherDataFromURL(url)
    }
    
    func getWeatherData(for cityName: String, errorNotifier: ((String, String?) -> Void)? = nil) -> WeatherDataResponse? {
        guard let urlSafeCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            return getWeatherDataFromURL(nil, errorNotifier: errorNotifier)
        }
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(urlSafeCityName)&appid=\(apiKey)&units=metric")
        
        return getWeatherDataFromURL(url, errorNotifier: errorNotifier)
    }
    
    private func getWeatherDataFromURL(_ url: URL?, errorNotifier: ((String, String?) -> Void)? = nil) -> WeatherDataResponse? {
        guard let url = url else { print("Unable to parse URL"); return nil }
        
        do {
            let data = try Data(contentsOf: url)
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherDataResponse.self, from: data)
                return weatherData
            } catch {
                errorNotifier?(error.localizedDescription, String(data: data, encoding: .utf8))
            }
        } catch {
            errorNotifier?(error.localizedDescription, nil)
        }
        
        return nil
    }
}
