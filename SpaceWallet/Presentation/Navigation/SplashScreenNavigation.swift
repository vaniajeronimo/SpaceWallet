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
				case .onAuthenticate:
					navigation.rootView(authentication)
				case .onContinue:
					navigation.rootView(home)
				default:
					break
			}
		}
	}

	@ViewBuilder
	private var home: some View {
		HomeScreen { action in
			Debug.log("Home action: \(action)")
		}
	}

	@ViewBuilder
	private var authentication: some View {
		AuthenticationNavigation {
			navigation.rootView(login)
		}
	}
}
