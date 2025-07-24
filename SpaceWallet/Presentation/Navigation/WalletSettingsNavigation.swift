//
//  WalletSettingsNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 24/07/2025.
//

import SwiftUI

struct WalletSettingsNavigation: View, Navigation {

	internal var navigation: NavigationController = NavigationController()

	init() {
		navigation.rootView(wallet)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	private var wallet: some View {
		NavigationBar {
			WalletSettingsScreen { _ in 
				print("onAction")
			}
		}
		.navigationTitle("wallet_settings_title".localized)
		.navigationSecondaryRightButton(.init(.custom(icon: .dots, hasBackground: true, action: {
			print("options pressed")
		})))
	}
}
