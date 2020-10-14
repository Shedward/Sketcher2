//
//  SourcesList.swift
//  iOS
//
//  Created by Vlad Maltsev on 14.10.2020.
//

import SwiftUI

struct SourcesList: View {

	private enum Route: Equatable, Identifiable {
		var id: Route {
			self
		}

		case newSource
	}

	@State
	private var openRoute: Route? = nil

	@Environment(\.presentationMode)
	var presentationMode: Binding<PresentationMode>

	let spacing = Design.SpacingLevel.level0

	var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .center, spacing: spacing.next.value) {
				Image("back")
					.onTapGesture {
						presentationMode.wrappedValue.dismiss()
					}
				Text("Источники")
					.font(Design.Font.h1)
				Spacer()
				Image("add")
					.padding(
						EdgeInsets(
							top: spacing.next(by: 4).value,
							leading: 0,
							bottom: 0,
							trailing: 0
						)
					)
					.onTapGesture {
						openRoute = .newSource
					}

			}
			Spacer()
		}
		.padding(spacing.value)
		.navigationBarRemoved()
		.sheet(item: $openRoute) { route -> AnyView in
			switch route {
			case .newSource:
				AnyView(NewSourceFullView())
			}
		}
	}
}

struct SourcesList_Previews: PreviewProvider {
	static var previews: some View {
		SourcesList()
	}
}
