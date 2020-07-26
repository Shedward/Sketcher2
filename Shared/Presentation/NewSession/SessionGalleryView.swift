//
//  SessionGalleryView.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct SessionGalleryView: View {
	let images: [UIImage]
	let spacingLevel = Design.SpacingLevel.level0

    var body: some View {
		HStack(alignment: .center, spacing: spacingLevel.next.value) {
			ForEach(images, id: \.self) { image in
				Rectangle()
					.aspectRatio(3.0/4.0 ,contentMode: .fit)
					.foregroundColor(.clear)
					.background(
						Image(uiImage: image)
							.resizable()
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
			images: [UIImage(), UIImage(), UIImage()]
		)
		.padding(Design.SpacingLevel.level0.value)
		.previewLayout(.sizeThatFits)
    }
}
