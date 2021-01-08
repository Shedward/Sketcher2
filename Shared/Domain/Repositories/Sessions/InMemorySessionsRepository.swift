//
//  InMemorySessionsRepository.swift
//  iOS
//
//  Created by Vlad Maltsev on 07.01.2021.
//

final class InMemorySessionsRepository: SessionsRepository {
	private var sessionsStorage: [Session]

	init(initialSessions: [Session]) {
		sessionsStorage = initialSessions
	}

	func add(session: Session) {
		sessionsStorage.append(session)
	}

	func remove(session: Session) {
		sessionsStorage = sessionsStorage.filter { $0.id != session.id }
	}

	func sessions() -> [Session] {
		sessionsStorage
	}
}
