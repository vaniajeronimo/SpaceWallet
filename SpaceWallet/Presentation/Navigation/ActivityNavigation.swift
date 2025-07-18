//
//  ActivityNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 18/07/2025.
//

import SwiftUI

struct ActivityNavigation: View, Navigation {

	internal var navigation = NavigationController()

	init() {
		navigation.rootView(emptyScreen)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	@ViewBuilder
	private var emptyScreen: some View {
		EmptyScreen(
			screenTitle: "activity_empty_screen_mainTitle".localized,
			image: .empty_cart_retro,
			title: "activity_empty_screen_title".localized,
			subtitle: "activity_empty_screen_subtitle".localized,
			onAction: {
				print("Action triggered from empty screen")
			}
		)
	}
}
