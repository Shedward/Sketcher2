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
		ScrollView {
			HStack(spacing: spacingLevel.next.value) {
				ForEach(images, id: \.self) { image in
					Image(uiImage: image)
						.resizable()
						.aspectRatio(CGSize(width: 90, height: 120), contentMode: .fill)
						.background(Design.Color.group)
						.cornerRadius(spacingLevel.next.value)
				}
			}
		}
    }
}

struct SessionGalleryView_Previews: PreviewProvider {
    static var previews: some View {
		SessionGalleryView(
			images: [UIImage(), UIImage(), UIImage()]
		)
		.padding(Design.SpacingLevel.level0.value)
    }
}
