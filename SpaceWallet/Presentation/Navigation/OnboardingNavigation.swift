//
//  OnboardingNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import SwiftUI

struct OnboardingNavigation: View, Navigation {

	internal var navigation = NavigationController()

	init() {
		navigation.rootView(createPassword)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	@ViewBuilder
	private var createPassword: some View {
		CreatePasswordScreen {
			navigation.push(confirmPhoneNumber)
		}
	}

	@ViewBuilder
	private var confirmPhoneNumber: some View {
		ConfirmPhoneNumberScreen {
			navigation.push(verificationCode)
		}
	}

	@ViewBuilder
	private var verificationCode: some View {
		VStack {
			VerificationCodeScreen(isOnboardingFlow: true) { action in
				switch action {
					case .onContinue:
						navigation.push(biometricData)
					default:
						break
				}
			}
		}
	}

	@ViewBuilder
	private var biometricData: some View {
		VStack {
			BiometricDataScreen { action in
				switch action {
					case .next:
						navigation.push(walletSetup)
					case .back:
						navigation.rootView(login)
				}
			}
		}
	}

	@ViewBuilder
	private var walletSetup: some View {
		WalletSetupScreen { action in
			switch action {
				case .next(let wallet):
					navigation.push(loadingWallet(with: wallet))
				case .back:
					navigation.popOrDismiss()
			}
		}
	}

	@ViewBuilder
	private func loadingWallet(with wallet: WalletModel) -> some View {
		WalletSetupLoadingScreen(wallet: wallet) {
			navigation.push(walletSetupCompleted)
		}
	}

	@ViewBuilder
	private var walletSetupCompleted: some View {
		WalletSetupCompletedScreen {
			navigation.push(home)
		}
	}

	@ViewBuilder
	private var home: some View {
		HomeScreenNavigation()
	}

	@ViewBuilder
	private var login: some View {
		LoginScreenNavigation()
	}
}
