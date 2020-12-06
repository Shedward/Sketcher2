//
//  Source.swift
//  iOS
//
//  Created by Vlad Maltsev on 31.10.2020.
//

import Foundation

struct Source {
	struct Author {
		let type: SourceType
		let name: String?
	}

	let id: UUID
	let title: String
	let author: Author
	let preview: [AsyncImage]
}
