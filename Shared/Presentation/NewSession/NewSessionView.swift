//
//  NewSessionView.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct NewSessionView: View {
	let preview: [UIImage]

    var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: Design.SpacingLevel.level1.value) {
				Text("Новая сессия")
					.font(Design.Font.h1)
				SessionGalleryView(images: preview)
				FormSection(title: "Название") {
					FormFieldsGroup {
						Text("Название")
					}
				}
				FormSection {
					FormFieldsGroup {
						Text("Источники")
						Text("Порядок")
					}
				}
				FormSection(title: "Эффекты") {
					FormFieldsGroup {
						Text("Добавить...")
					}
				}
				FormSection {
					FormFieldsGroup {
						Text("Время на картинку")
						Text("Время сессии")
						Text("Переход")
					}
				}
				FormSection(title: "Теги") {
					EmptyView()
				}
			}
		}
		.padding(Design.SpacingLevel.level0.value)
    }
}

struct NewSession_Previews: PreviewProvider {
    static var previews: some View {
        NewSessionView(preview: [UIImage(), UIImage(), UIImage()])
    }
}
