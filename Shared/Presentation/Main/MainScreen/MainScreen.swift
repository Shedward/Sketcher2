//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

struct MainScreenView: View {
	let progress: [ProgressItem]
    let recomendations: [RecomendedSession]
    let sessions: [Session]
    let spacingLevel: Design.SpacingLevel

    var body: some View {
        NavigationView {
			VStack {
				MainScreenContentView(
					progress: progress,
					recomendations: recomendations,
					sessions: sessions,
					spacingLevel: spacingLevel
				)
				.navigationBarHidden(true)
				HStack {
					Image("settings")
					Spacer()
					Image("add")
				}
				.padding(
					EdgeInsets(
						top: spacingLevel.next.value,
						leading: spacingLevel.value,
						bottom: spacingLevel.value,
						trailing: spacingLevel.value
					)
				)
			}
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainScreenView(
				progress: Mocks.progressItems,
				recomendations: Mocks.recomendations,
                sessions: Mocks.sessions,
				spacingLevel: .level1
            )

            MainScreenView(
				progress: Mocks.progressItems,
				recomendations: Mocks.recomendations,
                sessions: Mocks.sessions,
				spacingLevel: .level0
            )
                .preferredColorScheme(.dark)
        }
    }
}
