//
//  CornerRadiusStyle.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct CornerRadiusStyle: ViewModifier {
	var radius: CGFloat
	var corners: UIRectCorner

	struct CornerRadiusShape: Shape {
		var radius: CGFloat
		var corners: UIRectCorner

		func path(in rect: CGRect) -> Path {
			let path = UIBezierPath(
				roundedRect: rect,
				byRoundingCorners: corners,
				cornerRadii: CGSize(width: radius, height: radius)
			)
			return Path(path.cgPath)
		}
	}

	func body(content: Content) -> some View {
		content
			.clipShape(CornerRadiusShape(radius: radius, corners: corners))
	}
}

extension View {
	func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
		ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
	}
}
