//
//  SessionStartView.swift
//  iOS
//
//  Created by Vlad Maltsev on 26.07.2020.
//

import SwiftUI

struct SessionStartView: View {
	let session: Session

    var body: some View {
		ZStack {
			Image(uiImage: session.preview)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.edgesIgnoringSafeArea(.all)
			VisualEffectView(effect: UIBlurEffect())
				.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			ZStack {
				HStack {
					Text(session.name)
				}
			}
		}
    }
}

struct SessionStart_Previews: PreviewProvider {
    static var previews: some View {
		SessionStartView(session: Mocks.session)
    }
}
