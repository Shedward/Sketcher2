//
//  SettingsView.swift
//  iOS
//
//  Created by Vlad Maltsev on 04.10.2020.
//

import SwiftUI

struct SettingsView: View {
	let spacing = Design.SpacingLevel.level0

	var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: spacing.value) {
					Text("Настройки")
						.font(Design.Font.h1)
					FormSection {
						FormFieldsGroup {
							NavigationLink(destination: Text("Destination")) {
								FormValueFieldView(title: "Источники")
							}
							.buttonStyle(PlainButtonStyle())
						}
					}
					FixedSpacer(height: spacing.next.value)
					FormSection(title: "О приложении") {
						FormFieldsGroup {
							FormValueFieldView(
								title: "Версия",
								value: "1.0 (15)",
								expanding: false
							)
							FormValueFieldView(
								title: "Автор",
								value: "@shedward",
								expanding: false
							)
						}
					}
				}
			}
			.padding(spacing.value)
		}
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
