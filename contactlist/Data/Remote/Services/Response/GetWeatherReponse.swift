//
//  GetWeatherReponse.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import Foundation

// MARK: - AstroResponse
struct AstroResponse: Codable {
    let product, astroResponseInit: String
    var datasery: [Datasery]

    enum CodingKeys: String, CodingKey {
        case product
        case astroResponseInit = "init"
        case datasery = "dataseries"
    }
}

// MARK: - Datasery
struct Datasery: Codable,Identifiable {
    var id: UUID = UUID()
    let date: Int
    let weather: String
    let temp2M: Temp2M
    let wind10MMax: Int

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case weather
        case temp2M = "temp2m"
        case wind10MMax = "wind10m_max"
    }
}


// MARK: - Temp2M
struct Temp2M: Codable {
    let max, min: Int
}

