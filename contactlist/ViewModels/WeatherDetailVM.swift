//
//  WheaterDetailViewModel.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import Foundation
import Combine
import CoreLocation
class WeatherDetailVM:ObservableObject,WeatherService{
    var apiSession: APIService
    
    private let locationManager:LocationManager
    @Published var currentLocation: CLLocationCoordinate2D?
    private var cancellables = Set<AnyCancellable>()
    @Published var weatherInfo: Datasery?
    @Published var weekWeather:[Datasery] = []
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
        locationManager = LocationManager()
        locationManager.requestLocation()
        locationManager.$location.sink(receiveValue: { location in
            if let location = location {
                DispatchQueue.main.async {
                    self.currentLocation = location.coordinate
                    self.getWeather()
                }
                
            }
        }).store(in: &cancellables)
    }
    
    func getWeather() {
        if let currentLocation = currentLocation{
            self.getWeather(lat: String(currentLocation.latitude), lon: String(currentLocation.longitude)).sink { result in
                switch result {
                    case .failure(let error):
                        print("Handle error: \(error)")
                    case .finished:
                        break
                }
            } receiveValue: { (weatherData) in
                
                self.updateDataInfo(data: weatherData.datasery)
                
            }
            .store(in: &cancellables)

        }
        
    }
    
    func updateDataInfo(data:[Datasery]){
        var datainfo = data
        self.weatherInfo = datainfo.removeFirst()
        self.weekWeather = datainfo
        
    }
    
    
}
