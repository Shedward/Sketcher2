//
//  Logger+Subsystems.swift
//  iOS
//
//  Created by Vlad Maltsev on 14.03.2021.
//

import os

struct LoggingSubsystem {
	fileprivate let path: String

	static let application = LoggingSubsystem(path: "com.sketcher")

	func appending(_ subpath: String) -> LoggingSubsystem {
		LoggingSubsystem(path: "\(path).\(subpath)")
	}
}

extension Logger {
	init(in subsystem: LoggingSubsystem, category: String) {
		self.init(subsystem: subsystem.path, category: category)
	}
}
