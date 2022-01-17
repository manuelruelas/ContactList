//
//  ApiError.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import Foundation
enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
