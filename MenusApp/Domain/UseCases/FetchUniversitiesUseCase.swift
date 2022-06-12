//
//  FetchUniversitiesUseCase.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import Foundation
import Combine
import UIKit

protocol FetchUniversitiesUseCaseContract {
    func execute(query: String?) -> AnyPublisher<[University], Error>
}

class FetchUniversitiesUseCase: FetchUniversitiesUseCaseContract {
    private let universitiesRepository: UniversitiesRepositoryContract
    
    init(universitiesRepository: UniversitiesRepositoryContract) {
        self.universitiesRepository = universitiesRepository
    }
    func execute(query: String?) -> AnyPublisher<[University], Error> {
        universitiesRepository.fetchPost(query: query)
            .eraseToAnyPublisher()
    }
}
