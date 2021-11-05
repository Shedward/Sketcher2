//
//  Binding+Keypath.swift
//  iOS
//
//  Created by Vlad Maltsev on 05.11.2021.
//

import SwiftUI

extension Binding {
	init<Root>(to keyPath: ReferenceWritableKeyPath<Root, Value>, on root: Root) {
		self.init {
			root[keyPath: keyPath]
		} set: { newValue in
			root[keyPath: keyPath] = newValue
		}
	}
}
