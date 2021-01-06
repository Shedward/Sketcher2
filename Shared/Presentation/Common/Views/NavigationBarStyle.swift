//
//  NavigationBarStyle.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.10.2020.
//

import SwiftUI

struct NavigationBarStyle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.navigationBarTitle("")
			.navigationBarHidden(true)
	}
}

extension View {
	func navigationBarRemoved() -> some View {
		ModifiedContent(content: self, modifier: NavigationBarStyle())
	}
}
