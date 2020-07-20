//
//  FormFieldsGroup.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

@_functionBuilder
struct FormFieldBuilder {

	static func buildBlock() -> EmptyView {
		EmptyView()
	}

	static func buildBlock<V1>(_ v1: V1) -> some View
	where V1: View {
		FormField(position: .topAndBotom) {
			v1
		}
	}

	static func buildBlock<V1, V2>(_ v1: V1, _ v2: V2) -> some View
	where V1: View, V2: View {
		VStack(alignment: .leading, spacing: 1.0) {
			FormField(position: .top) { v1 }
			FormField(position: .bottom) { v2 }
		}
	}

	static func buildBlock<V1, V2, V3>(_ v1: V1, _ v2: V2, _ v3: V3) -> some View
	where V1: View, V2: View, V3: View {
		VStack(alignment: .leading, spacing: 1.0) {
			FormField(position: .top) { v1 }
			FormField(position: .middle) { v2 }
			FormField(position: .bottom) { v3 }
		}
	}
}

enum FormFieldPosition {
	case topAndBotom
	case top
	case middle
	case bottom

	var roundedCorners: UIRectCorner {
		switch self {
		case .topAndBotom:
			return .allCorners
		case .top:
			return [.topLeft, .topRight]
		case .middle:
			return []
		case .bottom:
			return [.bottomLeft, .bottomRight]
		}
	}
}

struct FormField<Content: View>: View {
	let position: FormFieldPosition
	let spacingLevel = Design.SpacingLevel.level1
	let content: () -> Content

	var body: some View {
		content()
			.frame(maxWidth: .infinity)
			.padding(spacingLevel.value)
			.background(Design.Color.group)
			.cornerRadius(
				radius: spacingLevel.value,
				corners: position.roundedCorners
			)
	}
}

struct FormFieldsGroup<Content: View>: View {
	let builder: () -> Content

	init(@FormFieldBuilder builder: @escaping () -> Content) {
		self.builder = builder
	}

    var body: some View {
		builder()
    }
}

struct FormFieldsGroup_Previews: PreviewProvider {
    static var previews: some View {
		FormFieldsGroup {
			HStack {
				Text("Placeholder1")
				Spacer()
				Text("Value")
			}
			HStack {
				Text("Placeholder2")
				Spacer()
				Text("Value")
			}
			Text("Button")
		}
		.padding(Design.SpacingLevel.level0.value)
    }
}
