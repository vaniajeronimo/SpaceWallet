//
//  RootNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

struct RootNavigation: View, Navigation {

	internal var navigation = NavigationController()

	init() {
		navigation.rootView(splash)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	@ViewBuilder
	private var splash: some View {
		SplashScreen(onCompletion: { route in
			switch route {
				case .login:
					navigation.rootView(login)
				case .home:
					break
			}
		})
	}

	@ViewBuilder
	private var login: some View {
		LoginScreenNavigation()
	}
}
