//
//  SourceTypeCell.swift
//  iOS
//
//  Created by Vlad Maltsev on 12.12.2020.
//

import SwiftUI

struct SourceTypeCell: View {
	let sourceType: SourceType

    var body: some View {
		VStack {
			if let icon = sourceType.bigIcon {
				Image(uiImage: icon)
			} else {
				Rectangle()
			}
			Text(sourceType.title)
		}
    }
}

struct SourceTypeCell_Previews: PreviewProvider {
    static var previews: some View {
		SourceTypeCell(sourceType: .debug)
    }
}
