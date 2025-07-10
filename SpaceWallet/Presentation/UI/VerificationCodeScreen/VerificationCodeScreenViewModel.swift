//
//  VerificationCodeScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 08/07/2025.
//

import SwiftUI

extension VerificationCodeScreen {
	@Observable
	@MainActor
	final class ViewModel {

		private var isOnboardingFlow: Bool

		private var userEmail: String {
			UserDefaults.userEmail ?? ""
		}

		private var userPhoneNumber: String {
			UserDefaults.userPhoneNumber?.removeWhiteSpaces.mask(with: RegexHelper.phoneNumberMask) ?? ""
		}

		var attributedString: AttributedString {
			var string = AttributedString("verification_code_subtitle".localized(with: userEmail))
			string.font = .heading5
			string.foregroundColor = .textTertiary

			if let range = string.range(of: userEmail) {
				string[range].font = .heading5SemiBold
				string[range].foregroundColor = .textPrimary
			}

			return string
		}

		var onboardingAttributedString: AttributedString {
			var string = AttributedString("verification_code_onboarding_subtitle".localized(with: userPhoneNumber))
			string.font = .heading5
			string.foregroundColor = .textTertiary

			if let range = string.range(of: userPhoneNumber) {
				string[range].font = .heading5SemiBold
				string[range].foregroundColor = .textPrimary
			}
			return string
		}

		var attributedTextString: AttributedString {
			isOnboardingFlow ? onboardingAttributedString : attributedString
		}

		var remainingSeconds = 60
		var timer: Timer?

		init(isOnboardingFlow: Bool = false) {
			self.isOnboardingFlow = isOnboardingFlow
		}

		func getNewCode() {
			print("get new code called")
		}

		func startTimer() {
			timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
				Task { @MainActor in
					if self.remainingSeconds > 0 {
						self.remainingSeconds -= 1
					} else {
						self.timer?.invalidate()
						self.remainingSeconds = 60
						self.startTimer()
					}
				}
			}
		}
	}
}
