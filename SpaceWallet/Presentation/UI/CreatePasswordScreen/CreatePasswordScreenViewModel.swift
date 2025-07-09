//
//  CreatePasswordScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import Combine
import Factory
import SwiftUI

extension CreatePasswordScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var passwordState: CustomTextFieldState = .default
		var password: String = ""
		var isValidPassword: Bool = false

		var isWeakPassword: Bool = false
		var isMediumPassword: Bool = false
		var isStrongPassword: Bool = false

		init() { }

		private func isPasswordValid() -> Bool {
			guard password.isNotEmpty && password.count >= 5 else {
				isWeakPassword = true
				return false
			}

			if passwordContainsNumberOrSymbol(password) {
				isStrongPassword = true
			} else {
				isMediumPassword = false
			}
			return false
		}

		func validatePassword() {
			isValidPassword = isPasswordValid()
		}

		private func passwordContainsNumberOrSymbol(_ password: String) -> Bool {
			let regex = try? NSRegularExpression(pattern: RegexHelper.password)
			let range = NSRange(password.startIndex..., in: password)
			return regex?.firstMatch(in: password, options: [], range: range) != nil
		}
	}
}
