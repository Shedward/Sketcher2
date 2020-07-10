//
//  Fonts.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

extension Font {
    enum Design {
        static func main(size: CGFloat) -> Font {
            custom("Montserrat-Medium", size: size)
        }

        static func mainBold(size: CGFloat) -> Font {
            custom("Montserrat-Bold", size: size)
        }

        static let h1 = mainBold(size: 24)
        static let h2 = mainBold(size: 18)
        static let h3 = mainBold(size: 15)

        static let body = main(size: 18)
        static let body3 = main(size: 15)

        static let caption = main(size: 12)
    }
}
