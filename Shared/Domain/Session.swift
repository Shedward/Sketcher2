//
//  Session.swift
//  Sketcher SUI
//
//  Created by Vlad Maltsev on 11.07.2020.
//

import UIKit

struct Session: Identifiable {
    let id = UUID()
    let name: String
    let preview: UIImage
}
