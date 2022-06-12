//
//  APIService.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import Foundation
import Combine

protocol APIServiceContract {
    func makeRequest<T: Decodable>(_ urlRequest: URLRequest, responseType: T.Type) -> AnyPublisher<T, Error>
}

class APIService: APIServiceContract {
    func makeRequest<T>(_ urlRequest: URLRequest, responseType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
       return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw ApplicationError.invalidResponse
                }
                
                return output.data
            }
            .decode(type: responseType.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

enum ApplicationError: Error {
    case invalidResponse
    case invalidEndpoint
}
