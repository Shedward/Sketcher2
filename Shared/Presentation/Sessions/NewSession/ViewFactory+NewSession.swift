//
//  ViewFactory+NewSession.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func newSession() -> AnyView {
		let view = NewSessionView(newSession: Mocks.newSession)
		return AnyView(view)
	}
}
