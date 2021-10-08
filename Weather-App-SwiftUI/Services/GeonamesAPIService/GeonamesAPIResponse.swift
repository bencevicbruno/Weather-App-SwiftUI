//
//  GeonamesAPIResponse.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/8/21.
//

import Foundation

struct GeonamesAPIResponse: Codable {
    let geonames: [City]
    
    struct City: Codable {
        let name: String
    }
}
