//
//  ViewFactory+Session.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func session(_ session: Session) -> AnyView {
		let view = SessionView(session: session)
		return AnyView(view)
	}
}