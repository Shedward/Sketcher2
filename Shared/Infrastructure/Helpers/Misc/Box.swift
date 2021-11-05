//
//  Box.swift
//  iOS
//
//  Created by Vlad Maltsev on 05.11.2021.
//

final class Box<Wrapped: AnyObject> {
	weak var value: Wrapped?

	init(_ value: Wrapped? = nil) {
		self.value = value
	}
}
