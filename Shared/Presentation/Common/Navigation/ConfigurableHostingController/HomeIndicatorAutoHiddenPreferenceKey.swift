//
//  HomeIndicatorAutoHiddenPreferenceKey.swift
//  iOS
//
//  Created by Vlad Maltsev on 05.11.2021.
//

import SwiftUI

struct HomeIndicatorAutoHiddenPreferenceKey: PreferenceKey {
	typealias Value = Bool

	static var defaultValue: Bool = false

	static func reduce(value: inout Bool, nextValue: () -> Bool) {
		value = nextValue() || value
	}
}

extension View {
	func prefersHomeIndicatorAutoHidden(_ value: Bool) -> some View {
		preference(key: HomeIndicatorAutoHiddenPreferenceKey.self, value: value)
	}

	func preferFullscreenAppearance(_ value: Bool) -> some View {
		prefersHomeIndicatorAutoHidden(value).statusBar(hidden: value)
	}
}
