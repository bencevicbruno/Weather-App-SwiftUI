//
//  GeonamesAPIServiceProtocol.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/8/21.
//

import Foundation

protocol GeonameAPIServiceProtocol {
    typealias SuccessHandler = ([String]) -> Void
    typealias FailureHandler = (String, String) -> Void
    
    func fetchListOfCities(prefixedWith prefix: String, onSuccess: @escaping SuccessHandler, onFailure: FailureHandler?)
}

extension GeonameAPIServiceProtocol {
    func fetchListOfCities(prefiexWith prefix: String, onSuccess: @escaping SuccessHandler) {
        return self.fetchListOfCities(prefixedWith: prefix, onSuccess: onSuccess, onFailure: nil)
    }
}
