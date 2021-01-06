//
//  FixedSpacer.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 23.07.2020.
//

import SwiftUI

struct FixedSpacer: View {

	let width: CGFloat
	let height: CGFloat

	init(width: CGFloat = 0, height: CGFloat = 0) {
		self.width = width
		self.height = height
	}

    var body: some View {
		Rectangle()
			.frame(width: width, height: height, alignment: .center)
			.foregroundColor(.clear)
    }
}

struct FixedSpacer_Previews: PreviewProvider {
    static var previews: some View {
		VStack(spacing: 0) {
			Rectangle()
			FixedSpacer(height: 20)
			Rectangle()
		}
    }
}
