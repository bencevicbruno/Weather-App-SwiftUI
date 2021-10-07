//
//  CacheService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import Foundation

class CacheService {
    typealias ErrorHandler = (String) -> Void
    
    private static let settingsKey = "settings"
    private static let weatherKey = "weather"
    private static let previousSearchKey = "previousSearchKey"
    
    func loadSettings(onError: ErrorHandler? = nil) -> SettingsData {
        if let data = UserDefaults.standard.data(forKey: Self.settingsKey) {
            do {
                return try JSONDecoder().decode(SettingsData.self, from: data)
            } catch {
                onError?("Error decoding cached settings data: \(error.localizedDescription)")
            }
        } else {
            onError?("No cached settings data found.")
        }
        
        return SettingsData()
    }
    
    func saveSettings(_ settingsData: SettingsData, onError: ErrorHandler? = nil) {
        do {
            let data = try JSONEncoder().encode(settingsData)
            UserDefaults.standard.set(data, forKey: Self.settingsKey)
        } catch {
            onError?("Error encoding settings data: \(error.localizedDescription)")
        }
    }
    
    func deleteSettings() {
        UserDefaults.standard.removeObject(forKey: Self.settingsKey)
    }
    
    func loadWeatherData(onError: ErrorHandler? = nil) -> WeatherData {
        if let data = UserDefaults.standard.data(forKey: Self.weatherKey) {
            do {
                return try JSONDecoder().decode(WeatherData.self, from: data)
            } catch {
                onError?("Error decoding cached weather data: \(error.localizedDescription)")
            }
        } else {
            onError?("No cached weather data found.")
        }
        
        return WeatherData.empty
    }
    
    func saveWeatherData(_ weatherData: WeatherData, onError: ErrorHandler? = nil) {
        do {
            let data = try JSONEncoder().encode(weatherData)
            UserDefaults.standard.set(data, forKey: Self.weatherKey)
        } catch {
            onError?("Error encoding weather data: \(error.localizedDescription)")
        }
    }
    
    func deleteWeatherData() {
        UserDefaults.standard.removeObject(forKey: Self.weatherKey)
    }
    
    func loadPreviousSearch(onError: ErrorHandler? = nil) -> [String] {
        if let data = UserDefaults.standard.data(forKey: Self.previousSearchKey) {
            do {
                return try JSONDecoder().decode([String].self, from: data)
            } catch {
                onError?("Error decoding cached previously searched data: \(error.localizedDescription)")
            }
        } else {
            onError?("No cached weather data found.")
        }
        
        return []
    }
    
    func savePreviousSearch(_ prevData: [String], onError: ErrorHandler? = nil) {
        do {
            let data = try JSONEncoder().encode(prevData)
            UserDefaults.standard.set(data, forKey: Self.previousSearchKey)
        } catch {
            onError?("Error encoding previously searched data: \(error.localizedDescription)")
        }
    }
    
    func deletePreviousSearch() {
        UserDefaults.standard.removeObject(forKey: Self.previousSearchKey)
    }
}
