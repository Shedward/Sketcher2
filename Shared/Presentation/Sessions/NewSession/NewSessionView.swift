//
//  NewSessionView.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct NewSessionView: View {
	let newSession: NewSession

    var body: some View {
		ZStack(alignment: .bottom) {
			ScrollView(.vertical) {
				VStack(alignment: .leading, spacing: Design.SpacingLevel.level1.value) {
					NavigationBar(title: Localised.string("Новая сессия"))
						.font(Design.Font.h1)
					SessionGalleryView(images: newSession.preview)
					FormSection(title: Localised.string("Название")) {
						FormFieldsGroup {
							FormTextFieldView()
						}
					}
					FormSection {
						FormFieldsGroup {
							FormValueFieldView(
								title: Localised.string("Источники"),
								value: Mocks.string("8")
							)
							FormValueFieldView(
								title: Localised.string("Порядок"),
								value: Mocks.string("Случайный")
							)
						}
					}
					FormSection(title: Localised.string("Эффекты")) {
						FormFieldsGroup {
							FormButtonFieldView(title: Localised.string("Добавить..."))
						}
					}
					FormSection {
						FormFieldsGroup {
							FormValueFieldView(
								title: Localised.string("Время на картинку"),
								value: Mocks.string("1 мин")
							)
							FormValueFieldView(
								title: Localised.string("Время сессии"),
								value: Mocks.string("∞")
							)
							FormValueFieldView(
								title: Localised.string("Переход"),
								value: Mocks.string("Плавный")
							)
						}
					}
					FormSection(title: Localised.string("Теги")) {
						TagsEditorView(tags: newSession.tags)
					}
					FixedSpacer(height: ActionButton.size.height)
				}
				.padding(Design.SpacingLevel.level0.value)
			}
			.background(Design.Color.background)

			ActionButton(title: Localised.string("Сохранить"), style: .normal)
				.padding(.bottom, Design.SpacingLevel.level0.value)
		}
    }
}

struct NewSession_Previews: PreviewProvider {
    static var previews: some View {
		NewSessionView(newSession: Mocks.newSession)
			.previewLayout(.sizeThatFits)

    }
}
