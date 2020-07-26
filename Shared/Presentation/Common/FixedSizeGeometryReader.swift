//
//  FixedSizeGeometryReader.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 25.07.2020.
//

import SwiftUI

struct ContentSizePreferenceKey: PreferenceKey {
	struct Size: Equatable {
		let width: CGFloat?
		let height: CGFloat?

		init(width: CGFloat? = nil, height: CGFloat? = nil) {
			self.width = width
			self.height = height
		}
	}

	static var defaultValue: Size = Size()
	static func reduce(value: inout Size, nextValue: () -> Size) {
		value = nextValue()
	}
}

protocol SelfSizingView: View {
	func size() -> CGSize
}

struct FixedSizeGeometryReader<Content: View>: View {

	let content: (GeometryProxy) -> Content
	@State private var contentSize: ContentSizePreferenceKey.Value = .init()

	init(@ViewBuilder _ content: @escaping (GeometryProxy) -> Content) {
		self.content = content
	}

	var body: some View {
		GeometryReader { geometry in
			content(geometry)
		}
		.frame(
			width: contentSize.width,
			height: contentSize.height
		)
		.onPreferenceChange(ContentSizePreferenceKey.self) { value in
			self.contentSize = value
		}
    }
}

struct FixedSizeGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
		FixedSizeGeometryReader { geometry in
			let size = geometry.frame(in: .local).size
			let contentSize = CGSize(
				width: 0.5 * size.width,
				height: size.height
			)
			Rectangle()
				.size(contentSize)
				.background(Color.blue)
				.preference(
					key: ContentSizePreferenceKey.self,
					value: .init(width: contentSize.width, height: contentSize.height)
				)
		}
		.previewLayout(.sizeThatFits)
    }
}
