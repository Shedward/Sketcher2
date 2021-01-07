//
//  Dependencies.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

protocol SessionsRepositoryDependency {
	var sessionsRepository: SessionsRepository { get }
}

protocol SourcesRepositoryDependency {
	var sourcesRepository: SourcesRepository { get }
}

protocol ProgressRepositoryDependency {
	var progressRepository: ProgressRepository { get }
}

typealias RepositoriesDependencies = SessionsRepositoryDependency
	& SourcesRepositoryDependency
	& ProgressRepositoryDependency
