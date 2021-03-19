//
//  SourceListViewModel.swift
//  iOS
//
//  Created by Vlad Maltsev on 14.03.2021.
//

import SwiftUI
import Combine
import Foundation

enum SourceListViewRoutes: Identifiable {
	enum ObjectIdentifier: Hashable {
		case newSource
		case openSource(UUID)

		init(route: SourceListViewRoutes) {
			switch route {
			case .newSource:
				self = .newSource
			case .openSource(let source):
				self = .openSource(source.id)
			}
		}
	}

	var id: ObjectIdentifier {
		.init(route: self)
	}

	case newSource
	case openSource(Source)
}

protocol SourceListViewModel: ObservableObject {
	var sources: [Source] { get }
	var topDrawerSources: [Source] { get }
	var selectedSources: [Source] { get }
	var navigationBarAction: ActionItem? { get }
	var cellSelectionMode: SourceListSelectionMode { get }

	var openRoute: AnyPublisher<SourceListViewRoutes?, Never> { get }

	func didSelectSource(_ source: Source)
}
