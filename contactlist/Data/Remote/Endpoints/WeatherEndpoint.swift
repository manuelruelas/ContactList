//
//  WheaterEndpoint.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import Foundation
enum WeatherEndpoint {
    case getWeather(String,String)
}

extension WeatherEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .getWeather(let lat, let lon):
            guard let url = URL(string: "https://www.7timer.info/bin/civillight.php?lon=\(lon)&lat=\(lat)&ac=0&unit=metric&output=json")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
