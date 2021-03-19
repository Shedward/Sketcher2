//
//  ViewFactory+NewSession.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func newSession() -> some View {
		let view = NewSessionView(newSession: Mocks.newSession)
		return view
	}
}
