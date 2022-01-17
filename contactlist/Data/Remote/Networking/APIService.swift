//
//  ApiService.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
