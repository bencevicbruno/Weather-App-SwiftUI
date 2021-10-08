//
//  CacheService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import Foundation

class CacheService: CacheServiceProtocol {
    private static let settingsDataKey = "settingsData"
    private static let weatherDataKey = "weatherData"
    private static let previouslySearchedCitiesKey = "previouslySearchedCitiesKey"
    
    private var userDefaults = UserDefaults.standard
    
    func loadWeatherData(onSuccess: @escaping (WeatherData) -> Void, onFailure: FailureHandler? = nil) {
        Self.runInBackground {
            guard let data = self.userDefaults.data(forKey: Self.weatherDataKey) else {
                Self.runOnMainThread {
                    onFailure?("Error loading weather data", "No cached weather data found.")
                }
                return
            }
            
            let weatherData: WeatherData
            do {
                weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            } catch {
                Self.runOnMainThread {
                    onFailure?("Error decoding weather data file", error.localizedDescription)
                }
                return
            }
            
            Self.runOnMainThread {
                onSuccess(weatherData)
            }
        }
    }
    
    func save(weatherData: WeatherData, onSuccess: EmptyCallback? = nil, onFailure: FailureHandler? = nil) {
        Self.runInBackground {
            let data: Data
            do {
                data = try JSONEncoder().encode(weatherData)
            } catch {
                Self.runOnMainThread {
                    onFailure?("Error encoding weather data", error.localizedDescription)
                }
                return
            }
            
            self.userDefaults.set(data, forKey: Self.weatherDataKey)
        }
    }
    
    func deleteWeatherData() {
        Self.runInBackground {
            self.userDefaults.removeObject(forKey: Self.weatherDataKey)
        }
    }
    
    func loadSettings(onSuccess: @escaping (SettingsData) -> Void, onFailure: FailureHandler? = nil) {
        Self.runInBackground {
            guard let data = self.userDefaults.data(forKey: Self.settingsDataKey) else {
                Self.runOnMainThread {
                    onFailure?("Error loading settings data", "No cached settings data found.")
                }
                return
            }
            
            let settingsData: SettingsData
            do {
                settingsData = try JSONDecoder().decode(SettingsData.self, from: data)
            } catch {
                Self.runOnMainThread {
                    onFailure?("Error decoding settings data file", error.localizedDescription)
                }
                return
            }
            
            Self.runOnMainThread {
                onSuccess(settingsData)
            }
        }
    }
    
    func save(settingsData: SettingsData, onSuccess: EmptyCallback? = nil, onFailure: FailureHandler? = nil) {
        Self.runInBackground {
            let data: Data
            do {
                data = try JSONEncoder().encode(settingsData)
            } catch {
                Self.runOnMainThread {
                    onFailure?("Error enocding settings data", error.localizedDescription)
                }
                return
            }
            
            self.userDefaults.set(data, forKey: Self.settingsDataKey)
        }
    }
    
    func deleteSettings() {
        Self.runInBackground {
            self.userDefaults.removeObject(forKey: Self.settingsDataKey)
        }
    }
    
    func loadPreviouslySearchedCities(onSuccess: @escaping ([String]) -> Void, onFailure: FailureHandler? = nil) {
        Self.runInBackground {
            guard let data = self.userDefaults.data(forKey: Self.previouslySearchedCitiesKey) else {
                Self.runOnMainThread {
                    onFailure?("Error loading previously searched cities data", "No cached previously searched cities data found")
                }
                return
            }
            
            let previouslySearchedCities: [String]
            do {
                previouslySearchedCities = try JSONDecoder().decode([String].self, from: data)
            } catch {
                Self.runOnMainThread {
                    onFailure?("Error decoding previously searched cities data file", error.localizedDescription)
                }
                return
            }
            
            Self.runOnMainThread {
                onSuccess(previouslySearchedCities)
            }
        }
    }
    
    func save(previouslySearchedCities: [String], onSucces: EmptyCallback? = nil, onFailure: FailureHandler? = nil) {
        Self.runInBackground {
            let data: Data
            do {
                data = try JSONEncoder().encode(previouslySearchedCities)
            } catch {
                Self.runOnMainThread {
                    onFailure?("Error encoding previously searched cities data", error.localizedDescription)
                }
                return
            }
            
            self.userDefaults.set(data, forKey: Self.previouslySearchedCitiesKey)
        }
    }
    
    func deletePreviouslySearchedCities() {
        Self.runInBackground {
            self.userDefaults.removeObject(forKey: Self.previouslySearchedCitiesKey)
        }
    }
    
    private static func runOnMainThread(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }
    
    private static func runInBackground(_ closure: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            closure()
        }
    }
}
