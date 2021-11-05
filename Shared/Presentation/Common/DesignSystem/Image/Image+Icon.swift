//
//  Icon.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 06.11.2021.
//

import UIKit

extension Design.Image {
	enum Icon {
		static let images = UIImage.required(named: "images")
		static let time = UIImage.required(named: "time")

		enum ProgressKind {
			case none
			case normal
			case big
		}
		static func progress(_ kind: ProgressKind) -> UIImage {
			switch kind {
			case .none:
				return UIImage.required(named: "progress0")
			case .normal:
				return UIImage.required(named: "progress1")
			case .big:
				return UIImage.required(named: "progress2")
			}
		}

		enum SourceTypeIconSize {
			case small
			case big
		}
		static func sourceType(kind: SourceType, size: SourceTypeIconSize) -> UIImage {
			let imageName: String
			switch kind {
			case .debug:
				imageName = "debug"
			}

			let sizeSuffix: String
			switch size {
			case .small:
				sizeSuffix = "big"
			case .big:
				sizeSuffix = "small"
			}

			return UIImage.required(named: "sourceType.\(imageName).\(sizeSuffix)")
		}
	}
}
