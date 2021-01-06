//
//  ViewFactory+Settings.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func settings() -> AnyView {
		let view = SettingsView()
		return AnyView(view)
	}
}
