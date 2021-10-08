//
//  GeonamesService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import Foundation

class GeonamesAPIService: GeonameAPIServiceProtocol {
    func fetchListOfCities(prefixedWith prefix: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        DispatchQueue.global(qos: .background).async {
            let urlSafePrefix = prefix.lowercased().toURLSafe()
            
            guard let url = URL(string: "http://api.geonames.org/searchJSON?name_startsWith=\(urlSafePrefix)&maxRows=10&username=bencevic_bruno") else {
                Self.runOnMainThread {
                    onFailure?("Invalid city name", "Make sure your city name doesn't!")
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
            
            let response: GeonamesAPIResponse
            do {
                response = try JSONDecoder().decode(GeonamesAPIResponse.self, from: data)
            } catch {
                Self.runOnMainThread {
                    onFailure?("Error parsing JSON response", error.localizedDescription)
                }
                return
            }
            
            let cityNames = response.geonames.map { $0.name }
            let cities = Array(Set(cityNames)).sorted()
            Self.runOnMainThread {
                onSuccess(cities)
            }
        }
    }
    
    private static func runOnMainThread(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }
}
