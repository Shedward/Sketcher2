//
//  Mocks+String.swift
//  iOS
//
//  Created by Vlad Maltsev on 09.01.2021.
//

extension Mocks {
	static func string(_ text: String) -> String {
		#if DEBUG
		return text
		#else
		return "⦕\(text)⦖"
		#endif
	}
}
