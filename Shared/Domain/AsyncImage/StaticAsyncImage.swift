//
//  StaticAsyncImage.swift
//  iOS
//
//  Created by Vlad Maltsev on 28.08.2020.
//

import Combine
import UIKit

extension AsyncImages {
	struct Static: AsyncImage {

		private let image: UIImage

		init(image: UIImage) {
			self.image = image
		}

		func loadImage() -> AnyPublisher<UIImage, Error> {
			Just(image)
				.setFailureType(to: Error.self)
				.eraseToAnyPublisher()
		}

		func same(as other: AsyncImage) -> Bool {
			guard let staticOther = other as? Static else { return false }

			return image == staticOther.image
		}
	}
}
