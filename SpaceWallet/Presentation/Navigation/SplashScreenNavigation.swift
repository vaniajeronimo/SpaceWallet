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
				case .verificationCode:
					navigation.rootView(verificationCode)
				case .onboarding:
					navigation.rootView(onboarding)
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
	private var verificationCode: some View {
		VerificationCodeScreen { action in
			switch action {
				case .onBack:
					navigation.rootView(login)
				case .onContinue:
					navigation.rootView(home)
			}
		}
	}

	@ViewBuilder
	private var onboarding: some View {
		OnboardingNavigation()
	}
}
