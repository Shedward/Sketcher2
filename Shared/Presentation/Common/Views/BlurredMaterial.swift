//
//  BlurredMaterial.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 29.07.2020.
//

import SwiftUI

struct BlurredMaterial: View {
	@Environment(\.colorScheme) var colorScheme

	var body: some View {
		let blurStyle: UIBlurEffect.Style = colorScheme == .light
			? .systemUltraThinMaterialDark
			: .systemUltraThinMaterialLight

		return VisualEffectView(
			effect: UIBlurEffect(style: blurStyle)
		)
	}
}
