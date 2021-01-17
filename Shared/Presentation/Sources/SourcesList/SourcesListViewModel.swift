//
//  SourcesListViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 18.01.2021.
//

import SwiftUI

extension SourcesListView {
    final class ViewModel: ObservableObject {
        typealias Dependencies = SourcesRepositoryDependency

        @Published
        var sources: [Source]

        init(dependencies: Dependencies) {
            sources = dependencies.sourcesRepository.sources()
        }
    }
}
