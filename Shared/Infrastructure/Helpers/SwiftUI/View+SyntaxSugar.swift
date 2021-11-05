//
//  View+SyntaxSugar.swift
//  iOS
//
//  Created by Vlad Maltsev on 05.11.2021.
//

import SwiftUI

extension View {
	func asAnyView() -> AnyView {
		AnyView(self)
	}
}
