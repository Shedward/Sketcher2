//
//  Icon.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 06.11.2021.
//

import UIKit

extension Design.Image {
	enum Action {
		static let add = UIImage.required(named: "add")
		static let delete = UIImage.required(named: "delete")
		static let remove = UIImage.required(named: "remove")
		static let settings = UIImage.required(named: "settings")
		static let unknown = UIImage.required(named: "unknown")
	}
}
