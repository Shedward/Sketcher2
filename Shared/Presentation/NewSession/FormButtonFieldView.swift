//
//  FormButtonFieldView.swift
//  iOS
//
//  Created by Vlad Maltsev on 21.07.2020.
//

import SwiftUI

struct FormButtonFieldView: View {
	let title: String

    var body: some View {
		HStack {
			Text(title)
				.font(Design.Font.body1)
			Spacer()
		}
    }
}

struct FormButtonFieldView_Previews: PreviewProvider {
    static var previews: some View {
		FormButtonFieldView(title: "Нажать")
    }
}
