//
//  SourceType.swift
//  iOS
//
//  Created by Vlad Maltsev on 04.10.2020.
//

import UIKit

enum SourceType {
	case debug

	var title: String {
		switch self {
		case .debug:
			return "Debug"
		}
	}

	var icon: UIImage? {
		switch self {
			case .debug:
				return UIImage(named: "sourceType.debug")
		}
	}
}
