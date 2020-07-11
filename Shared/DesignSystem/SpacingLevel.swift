//
//  Spacing.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import SwiftUI

extension Design {
    struct SpacingLevel {
        static let step: CGFloat = 6

        static let level0 = SpacingLevel(value: step * 4)
        static let level1 = SpacingLevel(value: step * 3)
        static let level2 = SpacingLevel(value: step * 2)
        static let level3 = SpacingLevel(value: step * 1)
        static let level4 = SpacingLevel(value: step * 0.5)

        let value: CGFloat

        var next: SpacingLevel {
            var nextValue = value

            if nextValue > SpacingLevel.step {
                nextValue -= SpacingLevel.step
            } else if nextValue > 0.5 * SpacingLevel.step {
                nextValue -= 0.5 * SpacingLevel.step
            }

            return SpacingLevel(value:  nextValue)
        }

        func next(by levelsCount: UInt) -> SpacingLevel {
            var levels = levelsCount
            var nextSpacingLevel = self
            while levels > 0 {
                nextSpacingLevel = nextSpacingLevel.next
                levels -= 1
            }
            return nextSpacingLevel
        }

        private init(value: CGFloat) {
            self.value = value
        }
    }
}
