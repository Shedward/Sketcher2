//
//  MainScreenContent.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 17.07.2020.
//

import SwiftUI

struct MainScreenContent: View {
	let progress: [ProgressItem]?
	let recomendations: [RecomendedSession]
	let sessions: [Session]

	let spacingLevel: Design.SpacingLevel

    var body: some View {
		ScrollView {
			VStack(spacing: spacingLevel.value) {
				if let progress = progress, !progress.isEmpty {
					MainScreenSection(
						title: "Прогресс",
						spacing: spacingLevel.next,
						accessory: {
							EmptyView()
						},
						content: {
							ProgressHeader(
								progressItems: progress,
								spacingLevel: spacingLevel.next(by: 2)
							)
						}
					)
				} else {
					SetupProgressHeader(
						title: "Начни рисовать регулярно",
						subtitle: "Настрой прогресс и напоминания",
						spacingLevel: spacingLevel.next(by: 2)
					)
				}
				if !recomendations.isEmpty {
					MainScreenSection(
						title: "Рекомендуем",
						spacing: spacingLevel.next,
						accessory: {
							EmptyView()
						},
						content: {
							RecomendedSessions(
								recomendations: recomendations,
								spacingLevel: spacingLevel
							)
						}
					)
				}
				if !sessions.isEmpty {
					MainScreenSection(
						title: "Сессии",
						spacing: spacingLevel.next,
						accessory: {
							Text("Изменить")
								.font(Design.Font.caption)
								.foregroundColor(Design.Color.content)
						},
						content: {
							UserSessions(
								sessions: sessions,
								spacingLevel: spacingLevel
							)
						}
					)
				}
			}
			.padding(spacingLevel.value)
		}
    }
}

struct MainScreenContent_Previews: PreviewProvider {
    static var previews: some View {
		MainScreenContent(
			progress: Mocks.progressItems,
			recomendations: Mocks.recomendations,
			sessions: Mocks.sessions,
			spacingLevel: .level0
		)
    }
}
