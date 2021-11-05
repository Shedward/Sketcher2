//
//  UIViewController+topMost.swift
//  iOS
//
//  Created by Vlad Maltsev on 05.11.2021.
//

import UIKit

extension UIViewController {
	static var topMost: UIViewController? {
		let keyWindow = UIApplication.shared
			.connectedScenes
			.compactMap { $0 as? UIWindowScene }
			.flatMap { $0.windows }
			.filter { $0.isKeyWindow }
			.first

		if var topController = keyWindow?.rootViewController {
			while let presentedViewController = topController.presentedViewController {
				topController = presentedViewController
			}
			return topController
		}
		return nil
	}
}
