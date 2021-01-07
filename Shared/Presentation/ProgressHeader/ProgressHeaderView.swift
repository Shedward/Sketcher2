//
//  ProgressHeaderView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 17.07.2020.
//

import SwiftUI

struct ProgressHeaderView: View {
	@ObservedObject var viewModel: ViewModel
	let spacingLevel: Design.SpacingLevel

    var body: some View {
		HStack(spacing: 2.0 * spacingLevel.value) {
			Spacer()
			ForEach(viewModel.progressItems, id: \.date) { progressItem in
				ProgressItemView(
					item: progressItem,
					spacingLevel: spacingLevel.next
				)
			}
			Spacer()
		}
		.padding(spacingLevel.value)
		.background(Design.Color.group)
		.cornerRadius(spacingLevel.value)
    }
}

struct ProgressHeader_Previews: PreviewProvider {
    static var previews: some View {
		HStack {
			ProgressHeaderView(
				viewModel: .init(dependencies: MockDependencies()),
				spacingLevel: .level2
			)
		}
		.padding(Design.SpacingLevel.level1.value)
    }
}
