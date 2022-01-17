//
//  WeatherService.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import Foundation
import Combine
protocol WeatherService {
    var apiSession: APIService {get}
    
    func getWeather(lat:String, lon: String) -> AnyPublisher<AstroResponse, APIError>
}

extension WeatherService {
    
    func getWeather(lat:String, lon: String) -> AnyPublisher<AstroResponse, APIError> {
        return apiSession.request(with: WeatherEndpoint.getWeather(lat, lon))
            .eraseToAnyPublisher()
    }
}
