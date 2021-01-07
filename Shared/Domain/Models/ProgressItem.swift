//
//  ProgressItem.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 17.07.2020.
//

import Foundation

struct ProgressItem {
	enum Level {
		case none
		case normal
		case hight
	}

	let level: Level
	let date: Date
}
