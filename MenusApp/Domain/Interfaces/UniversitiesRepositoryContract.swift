//
//  UniversitiesRepositoryContract.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import Foundation
import Combine 
protocol UniversitiesRepositoryContract {
    func fetchPost(query: String?) -> AnyPublisher<[University], Error>
}
