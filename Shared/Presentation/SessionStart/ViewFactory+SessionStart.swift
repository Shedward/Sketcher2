//
//  ViewFactory+SessionStart.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func sessionStart(_ session: Session) -> AnyView {
		let view = SessionStartView(session: session)
		return AnyView(view)
	}
}
