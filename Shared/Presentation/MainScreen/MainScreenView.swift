//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

struct MainScreenView: View {
	let progress: [ProgressItem]
    let recommendations: [RecommendedSession]
    let sessions: [Session]
    let spacingLevel: Design.SpacingLevel

	private enum Route: Equatable, Identifiable {
		var id: Route {
			self
		}

		case settings
		case newSession
	}

	@State
	private var openRoute: Route? = nil

    var body: some View {
        NavigationView {
			VStack {
				MainScreenContentView(
					progress: progress,
					recommendations: recommendations,
					sessions: sessions,
					spacingLevel: spacingLevel
				)
				.navigationBarHidden(true)
				HStack {
					Image("settings")
						.onTapGesture {
							openRoute = .settings
						}
					Spacer()
					Image("add")
						.onTapGesture {
							openRoute = .newSession
						}
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
		.sheet(item: $openRoute) { route in
			switch route {
			case .settings:
				AnyView(SettingsView())
			case .newSession:
				AnyView(NewSessionView(newSession: Mocks.newSession))
			}
		}
    }
}

struct MainScreen_Previews: PreviewProvider {


    static var previews: some View {
        Group {
            MainScreenView(
				progress: Mocks.progressItems,
				recommendations: Mocks.recommendations,
                sessions: Mocks.sessions,
				spacingLevel: .level0
            )

            MainScreenView(
				progress: Mocks.progressItems,
				recommendations: Mocks.recommendations,
                sessions: Mocks.sessions,
				spacingLevel: .level0
            )
			.preferredColorScheme(.dark)
        }
    }
}
