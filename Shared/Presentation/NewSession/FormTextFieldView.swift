//
//  FormTextFieldView.swift
//  iOS
//
//  Created by Vlad Maltsev on 21.07.2020.
//

import SwiftUI

struct FormTextFieldView: View {

	struct Underline: Shape {
		func path(in rect: CGRect) -> Path {
			Path { path in
				let radius = rect.height
				path.move(to: .zero)
				path.addQuadCurve(
					to: CGPoint(x: radius, y: radius),
					control: CGPoint(x: 0, y: radius)
				)
				path.addLine(to: CGPoint(x: rect.width - radius, y: radius))
				path.addQuadCurve(
					to: CGPoint(x: rect.width, y: 0),
					control: CGPoint(x: rect.width, y: radius))
			}
		}
	}

	@State var text: String = ""

    var body: some View {
		VStack(spacing: 0) {
			TextField("", text: $text)
				.font(Design.Font.body1)
				.padding([.leading, .trailing], Design.SpacingLevel.level4.value)
			Underline()
				.stroke(lineWidth: 1)
				.foregroundColor(Design.Color.accessory)
				.frame(height: Design.SpacingLevel.level4.value)
		}
    }
}

struct FormTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
		FormSection(title: "Название") {
			FormFieldsGroup {
				FormTextFieldView()
			}
		}
		.padding(Design.SpacingLevel.level0.value)
    }
}
