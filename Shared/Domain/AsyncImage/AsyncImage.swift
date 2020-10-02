//
//  AsyncImage.swift
//  iOS
//
//  Created by Vlad Maltsev on 28.08.2020.
//

import UIKit
import Combine

protocol AsyncImage {
	func loadImage() -> AnyPublisher<UIImage, Error>
	func same(as other: AsyncImage) -> Bool
}

enum AsyncImages {}


struct AnyAsyncImage: AsyncImage, Hashable {
	private let asyncImage: AsyncImage

	init(asyncImage: AsyncImage) {
		self.asyncImage = asyncImage
	}

	func loadImage() -> AnyPublisher<UIImage, Error> {
		asyncImage.loadImage()
	}

	func same(as other: AsyncImage) -> Bool {
		if let anyOther = other as? AnyAsyncImage {
			return asyncImage.same(as: anyOther.asyncImage)
		} else {
			return asyncImage.same(as: other)
		}
	}

	static func == (lhs: AnyAsyncImage, rhs: AnyAsyncImage) -> Bool {
		lhs.same(as: rhs)
	}

	func hash(into hasher: inout Hasher) {
	}
}
