//
//  SessionStart.swift
//  iOS
//
//  Created by Vlad Maltsev on 26.07.2020.
//

import SwiftUI

struct SessionStart: View {
    var body: some View {
		VStack {
			Image(uiImage: Mocks.Images.session2)
				.resizable()
				.aspectRatio(contentMode: .fill)
			Text("Hello, World!")
		}
    }
}

struct SessionStart_Previews: PreviewProvider {
    static var previews: some View {
        SessionStart()
    }
}
