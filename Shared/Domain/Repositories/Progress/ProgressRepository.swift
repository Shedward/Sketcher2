//
//  ProgressRepository.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

protocol ProgressRepository {
	var isConfigured: Bool { get }
	func recentProgress() -> [ProgressItem]
}
