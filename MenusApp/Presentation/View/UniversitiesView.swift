//
//  UniversitiesView.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import SwiftUI

struct UniversitiesView<ViewModel>: View where ViewModel: UniversitiesViewModelContract {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ScrollView {
            TextField("Search", text: $viewModel.query)
            ForEach(viewModel.universities, id: \.self.country) { university in
                
                HStack {
                    Text(university.name ?? "")
                    Text(university.country ?? "")
                }
        }
        }
    }
}
