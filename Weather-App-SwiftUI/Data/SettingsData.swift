//
//  SettingsData.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 9/28/21.
//

import Foundation

class SettingsData: NSObject, ObservableObject, Codable {
    @Published var useCelsius: Bool
    @Published var showHumidity: Bool
    @Published var showPressure: Bool
    @Published var showWindSpeed: Bool
    
    override init() {
        self.useCelsius = true
        self.showHumidity = true
        self.showPressure = true
        self.showWindSpeed = true
    }
    
    init(useCelsius: Bool, showHumidity: Bool, showPressure: Bool, showWindSpeed: Bool) {
        self.useCelsius = useCelsius
        self.showHumidity = showHumidity
        self.showPressure = showPressure
        self.showWindSpeed = showWindSpeed
    }
    
    static var test: SettingsData {
        SettingsData(useCelsius: true, showHumidity: true, showPressure: true, showWindSpeed: true)
    }
    
    // MARK: Codable
    
    enum CodingKeys: CodingKey {
        case useCelsius
        case showHumidity
        case showPressure
        case showWindSpeed
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.useCelsius = try container.decode(Bool.self, forKey: .useCelsius)
        self.showHumidity = try container.decode(Bool.self, forKey: .showHumidity)
        self.showPressure = try container.decode(Bool.self, forKey: .showPressure)
        self.showWindSpeed = try container.decode(Bool.self, forKey: .showWindSpeed)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.useCelsius, forKey: .useCelsius)
        try container.encode(self.showPressure, forKey: .showHumidity)
        try container.encode(showPressure, forKey: .showPressure)
        try container.encode(showWindSpeed, forKey: .showWindSpeed)
    }
}
