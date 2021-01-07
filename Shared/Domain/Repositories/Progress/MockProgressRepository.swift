//
//  MockProgressRepository.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

final class MockProgressRepository: ProgressRepository {
	var isConfigured: Bool {
		true
	}

	func recentProgress() -> [ProgressItem] {
		Mocks.progressItems
	}
}
