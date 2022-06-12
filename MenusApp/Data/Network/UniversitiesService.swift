//
//  UniversitiesService.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import Foundation
import Combine

protocol UniversitiesServiceContract {
    func fetchUniversities(query: String?) -> AnyPublisher<[UniversityDTO], Error>
}

class UniversitiesService: UniversitiesServiceContract {
    private let apiService: APIServiceContract
    
    init(apiService: APIServiceContract) {
        self.apiService = apiService
    }
    func fetchUniversities(query: String?) -> AnyPublisher<[UniversityDTO], Error> {
        // TODO: use the query item
        guard let url = URL(string: "http://universities.hipolabs.com/search") else {
            return Fail(error: ApplicationError.invalidEndpoint).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        
        if let query = query {
            let queryParams = [
                URLQueryItem(name: "country", value: "United+States"),
                URLQueryItem(name: "name", value: query)
            ]
            
            if let url = request.url {
                var components = URLComponents(string: url.absoluteString)
                components?.queryItems = queryParams
                
                request.url = components?.url
            }
        }

        
        return apiService.makeRequest(request, responseType: [UniversityDTO].self)
            .eraseToAnyPublisher()
    }
}
