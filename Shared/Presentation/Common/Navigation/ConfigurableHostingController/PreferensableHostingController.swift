//
//  PreferensableHostingController.swift
//  iOS
//
//  Created by Vlad Maltsev on 05.11.2021.
//

import SwiftUI

final class PreferensableHostingController: UIHostingController<AnyView> {
	private var isCurrentViewPrefersHomeIndicatorHidden = false {
		didSet {
			setNeedsUpdateOfHomeIndicatorAutoHidden()
		}
	}

	override var prefersHomeIndicatorAutoHidden: Bool {
		true
	}

	init<V: View>(wrappedView: V) {
		let box = Box<PreferensableHostingController>()

		let rootView = wrappedView
			.onPreferenceChange(HomeIndicatorAutoHiddenPreferenceKey.self) { prefersHomeIndicatorAutoHidden in
				box.value?.isCurrentViewPrefersHomeIndicatorHidden = prefersHomeIndicatorAutoHidden
			}
			.asAnyView()

		super.init(rootView: rootView)
		box.value = self
	}

	@MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
