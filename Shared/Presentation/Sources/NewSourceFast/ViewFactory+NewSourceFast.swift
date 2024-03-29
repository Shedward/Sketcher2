//
//  ViewFactory+NewSourceFast.swift
//  iOS
//
//  Created by Vlad Maltsev on 06.01.2021.
//

import SwiftUI

extension ViewFactory {
	func newSourceFast(_ newSource: NewSource) -> some View {
		let view = NewSourceFastView(newSource: newSource)
		return view
	}
}
