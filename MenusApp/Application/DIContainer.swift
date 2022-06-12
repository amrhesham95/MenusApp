//
//  DIContainer.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import Foundation

class DIContainer {
    static func getAPIService() -> APIServiceContract {
        return APIService()
    }
    static func getService() -> UniversitiesServiceContract {
        return UniversitiesService(apiService: DIContainer.getAPIService())
    }
    static func getRepository() -> UniversitiesRepositoryContract {
        UniversitiesRepository(universitiesService: DIContainer.getService())
    }
    static func getUseCase() -> FetchUniversitiesUseCaseContract {
        FetchUniversitiesUseCase(universitiesRepository: DIContainer.getRepository())
    }
    static func getViewModel() -> UniversitiesViewModel {
        UniversitiesViewModel(fetchUniversitiesUseCase: DIContainer.getUseCase())
    }
}
