//
//  OnboardingNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import SwiftUI

struct OnboardingNavigation: View, Navigation {

	internal var navigation = NavigationController()

	private let onDismiss: () -> Void

	init(onDismiss: @escaping () -> Void) {
		self.onDismiss = onDismiss
		navigation.rootView(createPassword)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	private var createPassword: some View {
			CreatePasswordScreen {
				navigation.push(confirmPhoneNumber)
			}
		}

	private var confirmPhoneNumber: some View {
			ConfirmPhoneNumberScreen {
				navigation.push(verificationCode)
			}
		}

	private var verificationCode: some View {
		VerificationCodeScreen(isOnboardingFlow: true) { action in
			switch action {
				case .onContinue:
					navigation.push(biometricData)
				default:
					break
			}
		}
	}

	private var biometricData: some View {
		NavigationBar {
			BiometricDataScreen { action in
				switch action {
					case .next:
						navigation.push(walletSetup)
					case .back:
						navigation.rootView(login)
				}
			}
		}
		.navigationLeftButton(.init(.custom(icon: .close_dark, action: { onDismiss() })))
		.navigationSecondaryRightButton(.init(.custom(icon: .info, action: { print("info tapped") })))
		.overlapNavigationBar()
	}

	private var walletSetup: some View {
		NavigationBar {
			WalletSetupScreen { action in
				switch action {
					case .next(let wallet):
						navigation.push(loadingWallet(with: wallet))
					case .back:
						navigation.popOrDismiss()
				}
			}
		}
		.navigationLeftButton(.init(.custom(icon: .close_dark, action: { navigation.popOrDismiss() })))
		.navigationSecondaryRightButton(.init(.custom(icon: .info, action: { print("info tapped") })))
		.overlapNavigationBar()
	}

	private func loadingWallet(with wallet: WalletModel) -> some View {
		WalletSetupLoadingScreen(wallet: wallet) {
			navigation.push(walletSetupCompleted(with: wallet))
		}
	}

	private func walletSetupCompleted(with wallet: WalletModel) -> some View {
		WalletSetupCompletedScreen(wallet: wallet) {
			navigation.push(landingPage)
		}
	}

	private var landingPage: some View {
		LandingPageScreen()
	}

	private var login: some View {
		LoginScreenNavigation()
	}
}
