//
//  Localised.swift
//  iOS
//
//  Created by Vlad Maltsev on 26.07.2020.
//

import Foundation

enum Localised {
	static func string(_ key: String) -> String {
		key
	}

	static func string(_ key: String, arguments: String...) -> String {
		String(format: key, arguments: arguments)
	}

	static func number(_ number: Int) -> String {
		"\(number)"
	}
}
