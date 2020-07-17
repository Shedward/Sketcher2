//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

struct MainScreen: View {
    let recomendations: [RecomendedSession]
    let sessions: [Session]
    let spacingLevel: Design.SpacingLevel

    var body: some View {
        NavigationView {
			VStack {
				MainScreenContent(
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
            MainScreen(
                recomendations: Mocks.recomendations,
                sessions: Mocks.sessions,
				spacingLevel: .level00
            )

            MainScreen(
                recomendations: Mocks.recomendations,
                sessions: Mocks.sessions,
				spacingLevel: .level00
            )
                .preferredColorScheme(.dark)
        }
    }
}
