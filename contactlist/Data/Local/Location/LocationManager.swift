//
//  LocationManager.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import Foundation
import CoreLocation
class LocationManager:NSObject,ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    @Published var location:CLLocation? = nil
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation(){
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        DispatchQueue.main.async{
            self.location = location
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
