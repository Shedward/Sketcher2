//
//  SessionViewModel.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 06.11.2021.
//

import Combine
import UIKit

extension SessionView {
	final class ViewModel: ObservableObject {
		private let session: Session

		@Published var currentImage: UIImage
		@Published var progress: CGFloat
		@Published var author: String?

		init(session: Session) {
			self.session = session
			currentImage = session.preview
			progress = 0
			author = session.author
		}
	}
}
