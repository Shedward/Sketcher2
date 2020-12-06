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

	let sources: [Source]
	let spacingLevel = Design.SpacingLevel.level0

	var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .center, spacing: spacingLevel.next.value) {
				Image("back")
					.onTapGesture {
						presentationMode.wrappedValue.dismiss()
					}
				Text("Источники")
					.font(Design.Font.h1)
				Spacer()
				Text("Изменить")
					.font(Design.Font.body3)
			}
			ScrollView {
				LazyVStack(spacing: spacingLevel.next.value) {
					ForEach(sources, id: \.id) { source in
						SourceCell(source: source)
					}
				}
			}
			HStack {
				Spacer()
				Image("add")
			}
			.padding(
				EdgeInsets(
					top: spacingLevel.next.value,
					leading: spacingLevel.value,
					bottom: 0,
					trailing: 0
				)
			)
		}
		.padding(spacingLevel.value)
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
		SourcesList(sources: Mocks.sourcesList)
	}
}
