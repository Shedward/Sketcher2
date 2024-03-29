//
//  NewSourceView.swift
//  iOS
//
//  Created by Vlad Maltsev on 02.08.2020.
//

import SwiftUI

struct NewSourceFastView: View {
	let newSource: NewSource
	let spacingLevel: Design.SpacingLevel = .level0

    var body: some View {
		VStack(alignment: .leading, spacing: spacingLevel.next.value) {
			NavigationBar(title: Localised.string("Новый источник"))
				.font(Design.Font.h1)
			SessionGalleryView(images: newSource.preview)
			FormSection(title: Localised.string("Название")) {
				FormFieldsGroup {
					FormTextFieldView(text: newSource.title)
				}
			}
			VStack(alignment: .center, spacing: 0) {
				ActionButton(title: Localised.string("Сохранить"), style: .normal)
				ActionButton(title: Localised.string("Закрыть"), style: .normalSecondary)
			}
			.frame(maxWidth: .infinity, alignment: .center)
		}
		.padding(spacingLevel.value)
		.background(Design.Color.background)
		.cornerRadius(spacingLevel.next.value)
		.padding(spacingLevel.value)
    }
}

struct NewSourceFastView_Previews: PreviewProvider {
    static var previews: some View {
		NewSourceFastView(newSource: Mocks.newSource)
			.background(Color.gray)
    }
}
