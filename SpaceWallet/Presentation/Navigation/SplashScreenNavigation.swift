//
//  SplashScreenNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

struct LoginScreenNavigation: View, Navigation {

	internal var navigation: NavigationController = NavigationController()

	init() {
		navigation.rootView(login)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	@ViewBuilder
	private var login: some View {
		LoginScreen { action in
			switch action {
				case .next:
					break
			}
		}
	}
}
