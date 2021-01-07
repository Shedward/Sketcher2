//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

struct MainScreenView: View {
	private enum Route: Equatable, Identifiable {
		var id: Route { self }

		case settings
		case newSession
	}

	let spacingLevel = Design.SpacingLevel.level0

	@Environment(\.viewFactory)
	var viewFactory: ViewFactory

	@State
	private var openRoute: Route? = nil

    var body: some View {
        NavigationView {
			VStack {
				viewFactory.mainScreenContent(spacingLevel: spacingLevel)
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
				viewFactory.settings()
			case .newSession:
				viewFactory.newSession()
			}
		}
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainScreenView()
            MainScreenView().preferredColorScheme(.dark)
        }
    }
}
