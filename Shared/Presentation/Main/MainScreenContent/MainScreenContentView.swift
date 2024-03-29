//
//  MainScreenContentView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 17.07.2020.
//

import SwiftUI

struct MainScreenContentView: View {

	@Environment(\.viewFactory)
	var viewFactory: ViewFactory

	@ObservedObject
	var viewModel: ViewModel

	let spacingLevel: Design.SpacingLevel

    var body: some View {
		ScrollView {
			VStack(spacing: spacingLevel.value) {
				switch viewModel.progressState {
				case .progress:
					MainScreenSectionView(
						title: Localised.string("Прогресс"),
						spacing: spacingLevel.next,
						accessory: {
							EmptyView()
						},
						content: {
							viewFactory.progressHeader(spacingLevel: spacingLevel.next(by: 2))
						}
					)
				case .notConfigured:
					SetupProgressHeaderView(
						title: Localised.string("Начни рисовать регулярно"),
						subtitle: Localised.string("Настрой прогресс и напоминания"),
						spacingLevel: spacingLevel.next(by: 2)
					)
				}

				if viewModel.showRecommendations {
					MainScreenSectionView(
						title: Localised.string("Рекомендуем"),
						spacing: spacingLevel.next,
						accessory: {
							EmptyView()
						},
						content: {
							viewFactory.recommendedSessions(spacingLevel: spacingLevel)
						}
					)
				}
				if viewModel.showUserSessions {
					MainScreenSectionView(
						title: Localised.string("Сессии"),
						spacing: spacingLevel.next,
						accessory: {
							Text(Localised.string("Изменить"))
								.font(Design.Font.body3)
								.foregroundColor(Design.Color.content)
						},
						content: {
							viewFactory.userSessions(spacingLevel: spacingLevel)
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
		MainScreenContentView(viewModel: .init(dependencies: MockDependencies()), spacingLevel: .level0)
    }
}
