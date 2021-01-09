//
//  SettingsView.swift
//  iOS
//
//  Created by Vlad Maltsev on 04.10.2020.
//

import SwiftUI

struct SettingsView: View {
	let spacing = Design.SpacingLevel.level0

	@Environment(\.viewFactory)
	private var viewFactory: ViewFactory

	var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: spacing.value) {
					NavigationBar(title: Localised.string("Настройки"))
						.font(Design.Font.h1)
					FormSection {
						FormFieldsGroup {
							NavigationLink(destination: viewFactory.sourcesList()) {
								FormValueFieldView(title: Localised.string("Источники"))
							}
							.buttonStyle(PlainButtonStyle())
						}
					}
					FixedSpacer(height: spacing.next.value)
					FormSection(title: Localised.string("О приложении")) {
						FormFieldsGroup {
							FormValueFieldView(
								title: Localised.string("Версия"),
								value: Mocks.string("1.0 (15)"),
								expanding: false
							)
							FormValueFieldView(
								title: Localised.string("Автор"),
								value: Mocks.string("@shedward"),
								expanding: false
							)
						}
					}
				}
			}
			.padding(spacing.value)
			.navigationBarRemoved()
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
