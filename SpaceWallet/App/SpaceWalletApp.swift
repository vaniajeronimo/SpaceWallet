//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftData
import SwiftUI

@main
struct SpaceWalletApp: SwiftUI.App {

	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

	let container: ModelContainer = {
		do {
			return try ModelContainer(for: AccountSwiftDataEntity.self)
		} catch {
			fatalError("Failed to create ModelContainer: \(error)")
		}
	}()

	init() {
		UIScrollView.appearance().keyboardDismissMode = .interactive
	}

    var body: some Scene {
        WindowGroup {
			RootNavigation()
				.modelContainer(container)
        }
    }
}
