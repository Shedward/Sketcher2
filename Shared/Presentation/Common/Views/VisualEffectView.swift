//
//  VisualEffectView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 12.07.2020.
//

import UIKit
import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    let effect: UIVisualEffect

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.effect = effect
    }
}
