//
//  LocationService.swift
//  Weather-App-SwiftUI
//
//  Created by Bruno Benčević on 10/6/21.
//

import CoreLocation

class LocationSerivce: NSObject, CLLocationManagerDelegate {
    typealias LocationConsumer = (CLLocationCoordinate2D) -> Void
    
    private lazy var locationManager = CLLocationManager()
    private var locationConsumers = [LocationConsumer]()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocationData(thenRun consumer: @escaping LocationConsumer) {
        locationConsumers.append(consumer)
        
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationConsumers.forEach { consumer in
                consumer(location.coordinate)
            }
            locationConsumers.removeAll()
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
