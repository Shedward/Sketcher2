//
//  LoadingImage.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 30.08.2020.
//

import Combine
import SwiftUI

struct LoadingImage: View {
	@ObservedObject private var viewModel: ViewModel

	init(asyncImage: AsyncImage, placeholder: UIImage? = nil) {
		viewModel = ViewModel(asyncImage: asyncImage, placeholder: placeholder)
	}

	var body: some View {
		ZStack {
			Rectangle()
				.fill(Design.Color.group)
			if let image = viewModel.image {
				Image(uiImage: image)
					.resizable()
			}
		}
		.animation(.default, value: viewModel.image)
		.onAppear {
			viewModel.load()
		}
	}
}

extension LoadingImage {
	final class ViewModel: ObservableObject {

		@Published private(set) var image: UIImage?

		let id = UUID()
		private let asyncImage: AsyncImage
		private var subscriptions = Subscriptions()

		init(asyncImage: AsyncImage, placeholder: UIImage?) {
			image = placeholder
			self.asyncImage = asyncImage
		}

		func load() {
			asyncImage.loadImage()
				.map { $0 as UIImage? }
				.replaceError(with: nil)
				.assign(to: \.image, on: self)
				.store(in: &subscriptions)
		}
	}
}
