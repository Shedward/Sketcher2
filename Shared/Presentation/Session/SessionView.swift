//
//  SessionView.swift
//  iOS
//
//  Created by Vlad Maltsev on 20.07.2020.
//

import SwiftUI

struct SessionView: View {
	let session: Session

    var body: some View {
		Text(session.name)
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
		SessionView(session: Mocks.session)
    }
}
