//
//  AuthorView.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.10.2020.
//

import SwiftUI

struct AuthorView: View {
	let author: Source.Author

    var body: some View {
		HStack(spacing: 4) {
			Text(Localised.string("от"))
				.font(Design.Font.body3)
			if let icon = author.type.smallIcon {
				Image(uiImage: icon)
			}
			if let authorName = author.name {
				Text(authorName)
					.font(Design.Font.body3)
			}
		}
		.foregroundColor(Design.Color.accessory)
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
		AuthorView(author: Mocks.source.author)
    }
}
