//
//  SeparatorView.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 07.03.2021.
//

import SwiftUI

struct SeparatorView: View {
	var color: Color = Design.Color.accessory

    var body: some View {
        Rectangle()
			.foregroundColor(color)
			.frame(maxWidth: .infinity, maxHeight: 0.5)
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
