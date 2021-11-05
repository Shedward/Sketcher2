//
//  PreferensableController.swift
//  iOS
//
//  Created by Vlad Maltsev on 05.11.2021.
//

import SwiftUI

struct PreferensableController<Wrapped: View>: UIViewControllerRepresentable {
	private let wrappedView: () -> Wrapped

	init(@ViewBuilder wrappedView: @escaping () -> Wrapped) {
		UIViewController.swizzleChildSearchMethods()
		self.wrappedView = wrappedView
	}

	func makeUIViewController(context: Context) -> some UIViewController {
		PreferensableHostingController(wrappedView: wrappedView())
	}

	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
	}
}

private extension UIViewController {
	static func swizzleChildSearchMethods() {
		let originalSelector = #selector(getter: UIViewController.childForHomeIndicatorAutoHidden)
		let swizzleSelector = #selector(UIViewController._preferensableController_childForHomeIndicatorAutoHidden)

		guard
			let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector),
			let swizzleMethod = class_getInstanceMethod(UIViewController.self, swizzleSelector)
		else {
			return
		}

		method_exchangeImplementations(originalMethod, swizzleMethod)
	}

	@objc dynamic func _preferensableController_childForHomeIndicatorAutoHidden() -> UIViewController? {
		if self is PreferensableHostingController {
			return nil
		} else {
			return findFirstChildPreferensableController()
		}
	}

	private func findFirstChildPreferensableController() -> PreferensableHostingController? {
		if let result = children.compactMap({ $0 as? PreferensableHostingController }).first {
			return result
		}

		for child in children {
			if let result = child.findFirstChildPreferensableController() {
				return result
			}
		}

		return nil
	}
}
