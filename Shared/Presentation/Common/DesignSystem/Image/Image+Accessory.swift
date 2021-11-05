//
//  Accessory.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 06.11.2021.
//

import UIKit

extension Design.Image {
	enum Accessory {
		static let chevron = UIImage.required(named: "chevron")
		static let bigChevron = UIImage.required(named: "bigChevron")

		static let back = UIImage.required(named: "back")

		static func checkmark(checked: Bool) -> UIImage {
			checked
				? UIImage.required(named: "checkmark.checked")
				: UIImage.required(named: "checkmark.unchecked")
		}
	}
}
