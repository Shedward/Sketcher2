//
//  MockAsyncImage.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 30.08.2020.
//

import Combine
import UIKit

extension AsyncImages {
	struct Mock: AsyncImage {
		private let image: UIImage
		private let timeout: TimeInterval

		init(image: UIImage, timeout: TimeInterval = .zero) {
			self.image = image
			self.timeout = timeout
		}

		func loadImage() -> AnyPublisher<UIImage, Error> {
			Just(image)
				.delay(
					for: .milliseconds(Int(timeout) * 1000),
					scheduler: DispatchQueue.main
				)
				.setFailureType(to: Error.self)
				.eraseToAnyPublisher()
		}

		func same(as other: AsyncImage) -> Bool {
			guard let mockOther = other as? Mock else { return false }
			return image == mockOther.image
		}
	}
}
