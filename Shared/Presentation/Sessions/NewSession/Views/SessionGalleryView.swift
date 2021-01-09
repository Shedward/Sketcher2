//
//  SessionGalleryView.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct SessionGalleryView: View {
	let images: [AsyncImage]
	let spacingLevel = Design.SpacingLevel.level0

    var body: some View {
		HStack(alignment: .center, spacing: spacingLevel.next.value) {
			let anyImages = images.map { AnyAsyncImage(asyncImage: $0) }
			ForEach(anyImages, id: \.self) { image in
				Rectangle()
					.aspectRatio(3.0/4.0, contentMode: .fit)
					.foregroundColor(.clear)
					.background(
						LoadingImage(asyncImage: image)
							.background(Design.Color.group)
							.scaledToFill()
					)
					.cornerRadius(spacingLevel.next.value)
			}
		}
		.fixedSize(horizontal: false, vertical: true)
	}
}

struct SessionGalleryView_Previews: PreviewProvider {
    static var previews: some View {
		SessionGalleryView(
			images: Mocks.newSource.preview
		)
		.padding(Design.SpacingLevel.level0.value)
		.previewLayout(.sizeThatFits)
    }
}
