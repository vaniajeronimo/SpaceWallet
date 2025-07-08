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

		private var userEmail: String {
			UserDefaults.userEmail ?? ""
		}

		var attributedString: AttributedString {
			var string = AttributedString("verification_code_subtitle".localized(with: userEmail))
			string.font = .heading5

			if let range = string.range(of: userEmail) {
				string[range].font = .heading5SemiBold
			}
			return string
		}

		var remainingSeconds = 60
		var timer: Timer?

		init() {}

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
