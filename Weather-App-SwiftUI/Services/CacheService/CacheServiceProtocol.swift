//
//  CacheServiceProtocol.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/8/21.
//

import Foundation

protocol CacheServiceProtocol {
    typealias FailureHandler = (String, String) -> Void
    
    func loadWeatherData(onSuccess: @escaping (WeatherData) -> Void, onFailure: FailureHandler?)
    func save(weatherData: WeatherData, onSuccess: EmptyCallback?, onFailure: FailureHandler?)
    func deleteWeatherData()
    
    func loadSettings(onSuccess: @escaping (SettingsData) -> Void, onFailure: FailureHandler?)
    func save(settingsData: SettingsData, onSuccess: EmptyCallback?, onFailure: FailureHandler?)
    func deleteSettings()
    
    func loadPreviouslySearchedCities(onSuccess: @escaping ([String]) -> Void, onFailure: FailureHandler?)
    func save(previouslySearchedCities: [String], onSucces: EmptyCallback?, onFailure: FailureHandler?)
    func deletePreviouslySearchedCities()
}

extension CacheServiceProtocol {
    func loadWeatherData(onSuccess: @escaping (WeatherData) -> Void, onFailure: FailureHandler? = nil) {
        self.loadWeatherData(onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func save(weatherData: WeatherData, onSuccess: EmptyCallback? = nil, onFailure: FailureHandler? = nil) {
        self.save(weatherData: weatherData, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func loadSettings(onSuccess: @escaping (SettingsData) -> Void, onFailure: FailureHandler? = nil) {
        self.loadSettings(onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func save(settingsData: SettingsData, onSuccess: EmptyCallback? = nil, onFailure: FailureHandler? = nil) {
        self.save(settingsData: settingsData, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func loadPreviouslySearchedCities(onSuccess: @escaping ([String]) -> Void, onFailure: FailureHandler? = nil) {
        self.loadPreviouslySearchedCities(onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func save(previouslySearchedCities: [String], onSucces: EmptyCallback? = nil, onFailure: FailureHandler? = nil) {
        self.save(previouslySearchedCities: previouslySearchedCities, onSucces: onSucces, onFailure: onFailure)
    }
}
