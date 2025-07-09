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
				case .authenticate:
					navigation.rootView(authentication)
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
