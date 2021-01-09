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
			UIKit.UIFont(name: "Montserrat-SemiBold", size: size)
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

struct Fonts_Previews: PreviewProvider {
	static var previews: some View {
		VStack(alignment: .leading, spacing: 32) {
			Text("h1 - Lorem ipsum").font(Design.Font.h1)
			Text("h2 - Lorem ipsum").font(Design.Font.h2)
			Text("h3 - Lorem ipsum").font(Design.Font.h3)
			Text("h4 - Lorem ipsum").font(Design.Font.h4)
			Text("body1 - Lorem ipsum").font(Design.Font.body1)
			Text("body2 - Lorem ipsum").font(Design.Font.body2)
			Text("body3 - Lorem ipsum").font(Design.Font.body3)
			Text("body4 - Lorem ipsum").font(Design.Font.body4)
		}
		.previewLayout(.sizeThatFits)
		.padding(16)
	}
}

struct AllFonts_Previews: PreviewProvider {
	static var previews: some View {
		ScrollView {
			VStack(alignment: .leading) {
				ForEach(UIFont.familyNames, id: \.self) { familyName in
					Text(familyName)
						.font(.headline)
					VStack(alignment: .leading) {
						ForEach(UIFont.fontNames(forFamilyName: familyName), id: \.self) { font in
							Text(font)
						}
					}
				}
			}
		}
	}
}
