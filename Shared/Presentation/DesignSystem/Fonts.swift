//
//  Fonts.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import UIKit
import SwiftUI

extension Design {
	enum UIFont {
		private static func main(size: CGFloat) -> UIKit.UIFont {
			UIKit.UIFont(name: "Montserrat-Medium", size: size)
				?? UIKit.UIFont.systemFont(ofSize: UIKit.UIFont.systemFontSize)
		}

		private static func mainBold(size: CGFloat) -> UIKit.UIFont {
			UIKit.UIFont(name: "Montserrat-Medium", size: size)
				?? UIKit.UIFont.systemFont(ofSize: UIKit.UIFont.systemFontSize)
		}

		static let h1 = mainBold(size: 24)
		static let h2 = mainBold(size: 18)
		static let h3 = mainBold(size: 15)
		static let h4 = mainBold(size: 12)

		static let body1 = main(size: 18)
		static let body2 = main(size: 15)
		static let body3 = main(size: 12)
		static let body4 = main(size: 9)
	}

    enum Font {
		static let h1 = SwiftUI.Font(UIFont.h1)
		static let h2 = SwiftUI.Font(UIFont.h2)
		static let h3 = SwiftUI.Font(UIFont.h3)
		static let h4 = SwiftUI.Font(UIFont.h4)

		static let body1 = SwiftUI.Font(UIFont.body1)
		static let body2 = SwiftUI.Font(UIFont.body2)
		static let body3 = SwiftUI.Font(UIFont.body3)
		static let body4 = SwiftUI.Font(UIFont.body4)
    }
}
