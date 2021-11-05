//
//  DebugPublisher.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.08.2020.
//

import Combine

extension Publisher {
	func debug(_ prefix: String = "🐠") -> Publishers.HandleEvents<Self> {
		handleEvents(
			receiveSubscription: { debugPrint("\(prefix) receiveSubscription: \($0)") },
			receiveOutput: { debugPrint("\(prefix) receiveOutput: \($0)") },
			receiveCompletion: { debugPrint("\(prefix) receiveCompletion: \($0)") },
			receiveCancel: { debugPrint("\(prefix) receiveCancel.") },
			receiveRequest: { debugPrint("\(prefix) receiveRequest: \($0)") }
		)
	}
}
