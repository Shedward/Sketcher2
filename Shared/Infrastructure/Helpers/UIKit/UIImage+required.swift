//
//  UIImage+required.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 06.11.2021.
//

import UIKit

extension UIImage {
	static func required(named name: String) -> UIImage {
		guard let image = UIImage(named: name) else {
			assertionFailure("Can't load required image \(name)")
			return UIImage()
		}

		return image
	}
}
