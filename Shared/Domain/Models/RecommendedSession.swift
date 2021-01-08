//
//  RecommendedSession.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import Foundation

struct RecommendedSession: Identifiable {
	var id: UUID {
		session.id
	}

    let session: Session
    let reason: String
}
