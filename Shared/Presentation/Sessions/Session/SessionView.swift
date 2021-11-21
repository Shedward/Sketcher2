//
//  SessionView.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct SessionView: View {
	@ObservedObject
	var viewModel: ViewModel

    var body: some View {
		PreferensableController {
			ZStack {
				Image(uiImage: viewModel.currentImage)
					.resizable()
					.aspectRatio(contentMode: .fit)
				VStack {
					HStack {
						if let imageProgressDescription = imageProgressDescription(viewModel.imagesProgress) {
							BadgeView(text: imageProgressDescription)
						}
						Spacer()
						if let author = viewModel.author {
							BadgeView(text: author)
						}
					}
					Spacer()
					SessionProgressView(progress: 0.6)
				}
				.padding(Design.SpacingLevel.level0.value)
			}
			.background(Design.Color.background)
			.edgesIgnoringSafeArea(.all)
			.preferFullscreenAppearance(true)
		}
		.edgesIgnoringSafeArea(.all)
	}

	private func imageProgressDescription(_ imagesProgress: ViewModel.ImagesProgress?) -> String? {
		guard let imagesProgress = imagesProgress else {
			return nil
		}

		if let totalCount = imagesProgress.allImagesCount {
			return Localised.string(
				"%@/%@",
				arguments:
					Localised.number(imagesProgress.currentImageIndex),
					Localised.number(totalCount)
			)
		} else {
			return Localised.number(imagesProgress.currentImageIndex)
		}
	}
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
		SessionView(viewModel: .init(session: Mocks.session))
    }
}
