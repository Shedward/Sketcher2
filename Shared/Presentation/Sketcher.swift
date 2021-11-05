//
//  Sketcher_SUIApp.swift
//  Shared
//
//  Created by Vlad Maltsev on 10.07.2020.
//

import SwiftUI

@main
struct Sketcher: App {
	@UIApplicationDelegateAdaptor(SketcherAppDelegate.self) var appDelegate

	@Environment(\.viewFactory)
	var viewFactory: ViewFactory

    var body: some Scene {
        WindowGroup {
			viewFactory.mainScreen()
        }
    }
}
