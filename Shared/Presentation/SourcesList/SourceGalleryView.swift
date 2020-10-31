//
//  SourceGalleryView.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.10.2020.
//

import SwiftUI

struct SourceGalleryView: View {
	let images: [AsyncImage]
	let spacingLevel = Design.SpacingLevel.level2

	private let imageSize = CGSize(width: 49, height: 66)

	private struct GalleryItem {
		let index: Int
		let image: AnyAsyncImage
	}

    var body: some View {
		ZStack {
			let items = images
				.reversed()
				.enumerated()
				.map { index, image in
					GalleryItem(index: index, image: AnyAsyncImage(asyncImage: image))
				}

			ForEach(items, id: \.image) { item in
				LoadingImage(asyncImage: item.image)
					.scaledToFill()
					.frame(width: imageSize.width, height: imageSize.height)
					.cornerRadius(spacingLevel.value)
					.shadow(color: Design.Color.shadow, radius: 2, x: -1, y: 0)
					.offset(x: spacingLevel.next.value * CGFloat(item.index))
			}
		}
		.frame(
			width: imageSize.width + spacingLevel.value * CGFloat(images.count - 1),
			height: imageSize.height,
			alignment: .center
		)
    }
}

struct SourceGalleryView_Previews: PreviewProvider {
    static var previews: some View {
		SourceGalleryView(
			images: [
				AsyncImages.Mock(image: Mocks.Images.session1, timeout: 1),
				AsyncImages.Mock(image: Mocks.Images.session2, timeout: 2),
				AsyncImages.Mock(image: Mocks.Images.session3, timeout: 1),
				AsyncImages.Mock(image: Mocks.Images.session4, timeout: 3)
			]
		)
    }
}
