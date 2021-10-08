//
//  MockupGeonamesAPIService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/8/21.
//

import Foundation

class GeonamesAPIMockupService: GeonameAPIServiceProtocol {
    func fetchListOfCities(prefixedWith prefix: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?) {
        let cities = (1...10).map {
            "City #\($0)"
        }
        
        onSuccess(cities)
    }
}
