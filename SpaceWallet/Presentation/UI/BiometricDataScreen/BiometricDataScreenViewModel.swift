//
//  BiometricDataScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 11/07/2025.
//

import LocalAuthentication
import SwiftUI

extension BiometricDataScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var isAuthenticated: Bool = false
		var isToShowAlert: Bool = false
		var authError: String?

		func authenticate() {
			let context = LAContext()
			var error: NSError?

			if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
				let reason = "protect_your_wallet_subtitle".localized

				context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, evalError in
					Task { @MainActor in
						if success {
							self.isAuthenticated = true
							self.authError = nil
						} else {
							self.authError = evalError?.localizedDescription ?? "Failed to authenticate"
							self.isAuthenticated = false
						}
					}
				}
			} else {
				authError = error?.localizedDescription ?? "Biometric authentication not available"
				isAuthenticated = false
				isToShowAlert = true
			}
		}
	}
}
