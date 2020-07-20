//
//  MainScreenContentView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 17.07.2020.
//

import SwiftUI

struct MainScreenContentView: View {
	let progress: [ProgressItem]?
	let recomendations: [RecomendedSession]
	let sessions: [Session]

	let spacingLevel: Design.SpacingLevel

    var body: some View {
		ScrollView {
			VStack(spacing: spacingLevel.value) {
				if let progress = progress, !progress.isEmpty {
					MainScreenSectionView(
						title: "Прогресс",
						spacing: spacingLevel.next,
						accessory: {
							EmptyView()
						},
						content: {
							ProgressHeaderView(
								progressItems: progress,
								spacingLevel: spacingLevel.next(by: 2)
							)
						}
					)
				} else {
					SetupProgressHeaderView(
						title: "Начни рисовать регулярно",
						subtitle: "Настрой прогресс и напоминания",
						spacingLevel: spacingLevel.next(by: 2)
					)
				}
				if !recomendations.isEmpty {
					MainScreenSectionView(
						title: "Рекомендуем",
						spacing: spacingLevel.next,
						accessory: {
							EmptyView()
						},
						content: {
							RecomendedSessionsView(
								recomendations: recomendations,
								spacingLevel: spacingLevel
							)
						}
					)
				}
				if !sessions.isEmpty {
					MainScreenSectionView(
						title: "Сессии",
						spacing: spacingLevel.next,
						accessory: {
							Text("Изменить")
								.font(Design.Font.body3)
								.foregroundColor(Design.Color.content)
						},
						content: {
							UserSessionsView(
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
		MainScreenContentView(
			progress: Mocks.progressItems,
			recomendations: Mocks.recomendations,
			sessions: Mocks.sessions,
			spacingLevel: .level0
		)
    }
}
