//
//  UniversitiesRepository.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import Foundation
import Combine

class UniversitiesRepository: UniversitiesRepositoryContract {
    private let universitiesService: UniversitiesServiceContract
    
    init(universitiesService: UniversitiesServiceContract){
        self.universitiesService = universitiesService
    }
    func fetchPost(query: String?) -> AnyPublisher<[University], Error> {
        return universitiesService
            .fetchUniversities(query: query)
            .map {
                $0.map {
                    $0.toDomain()
                }
            }.eraseToAnyPublisher()
    }
}
