//
//  UniversitiesViewModel.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import Foundation
import Combine

protocol UniversitiesViewModelContract: ObservableObject {
    func fetchUniversities(query: String?)
    var universities: [University] {get}
    var query: String { get set }
    var queryPublisher: Published<String>.Publisher { get }
    var queryPublished: Published<String> { get }
    var universitiesPublisher: Published<[University]>.Publisher { get }
}

class UniversitiesViewModel: UniversitiesViewModelContract {
    var queryPublished: Published<String> {_query}
    
    var universitiesPublisher: Published<[University]>.Publisher {$universities}
    var queryPublisher: Published<String>.Publisher {$query}
    
    var cancellables = Set<AnyCancellable>()
    @Published var universities = [University]()
    @Published var query = ""
    
    private let fetchUniversitiesUseCase: FetchUniversitiesUseCaseContract
    
    init(fetchUniversitiesUseCase: FetchUniversitiesUseCaseContract) {
        self.fetchUniversitiesUseCase = fetchUniversitiesUseCase
        listenOnQueryChange()
        fetchUniversities(query: nil)
    }
    
    func fetchUniversities(query: String? = nil) {
        fetchUniversitiesUseCase.execute(query: query)
            .receive(on: RunLoop.main)
            .sink {
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Finished in view model")
                }
            } receiveValue: { [weak self] in
                self?.universities = $0
            }.store(in: &cancellables)

    }
    
    func listenOnQueryChange() {
        $query.sink { [weak self] in
            self?.fetchUniversities(query: $0)
        }.store(in: &cancellables)
    }
}
