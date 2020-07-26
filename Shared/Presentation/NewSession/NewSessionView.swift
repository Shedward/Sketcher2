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
					Text("Новая сессия")
						.font(Design.Font.h1)
					SessionGalleryView(images: newSession.preview)
					FormSection(title: "Название") {
						FormFieldsGroup {
							FormTextFieldView()
						}
					}
					FormSection {
						FormFieldsGroup {
							FormValueFieldView(title: "Источники", value: "8")
							FormValueFieldView(title: "Порядок", value: "Случайный")
						}
					}
					FormSection(title: "Эффекты") {
						FormFieldsGroup {
							FormButtonFieldView(title: "Добавить...")
						}
					}
					FormSection {
						FormFieldsGroup {
							FormValueFieldView(title: "Время на картинку", value: "1 мин")
							FormValueFieldView(title: "Время сессии", value: "∞")
							FormValueFieldView(title: "Переход", value: "Плавный")
						}
					}
					FormSection(title: "Теги") {
						TagsEditorView(tags: newSession.tags)
					}
					FixedSpacer(height: ActionButton.size.height)
				}
				.padding(Design.SpacingLevel.level0.value)
			}
			.background(Design.Color.background)

			ActionButton(title: "Сохранить", style: .normal)
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
