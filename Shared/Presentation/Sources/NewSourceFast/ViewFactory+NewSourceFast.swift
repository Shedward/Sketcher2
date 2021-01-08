//
//  ViewFactory+NewSourceFast.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func newSourceFast(_ newSource: NewSource) -> AnyView {
		let view = NewSourceFastView(newSource: newSource)
		return AnyView(view)
	}
}
