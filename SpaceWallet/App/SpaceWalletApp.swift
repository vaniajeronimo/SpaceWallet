//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

@main
struct SpaceWalletApp: SwiftUI.App {

	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

	init() {
		UIScrollView.appearance().keyboardDismissMode = .interactive
	}

    var body: some Scene {
        WindowGroup {
			RootNavigation()
        }
    }
}
