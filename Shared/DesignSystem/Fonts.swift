//
//  Fonts.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

extension Design {
    enum Font {
        private static func main(size: CGFloat) -> SwiftUI.Font {
            SwiftUI.Font.custom("Montserrat-Medium", size: size)
        }

        private static func mainBold(size: CGFloat) -> SwiftUI.Font {
            SwiftUI.Font.custom("Montserrat-Bold", size: size)
        }

        static let h1 = mainBold(size: 24)
        static let h2 = mainBold(size: 18)
        static let h3 = mainBold(size: 15)

        static let body = main(size: 18)
        static let body3 = main(size: 15)

        static let caption = main(size: 12)
    }
}
