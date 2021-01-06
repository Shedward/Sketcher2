//
//  ViewFactory+NewSession.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func newSession(_ newSession: NewSession) -> AnyView {
		let view = NewSessionView(newSession: newSession)
		return AnyView(view)
	}
}
