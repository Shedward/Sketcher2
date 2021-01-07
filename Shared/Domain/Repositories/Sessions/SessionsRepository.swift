//
//  SessionsRepository.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

protocol SessionsRepository {
	func add(session: Session)
	func remove(session: Session)
	func sessions() -> [Session]
}
