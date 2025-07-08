//
//  LoginViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 04/07/2025.
//

import SwiftUI

extension LoginScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var illustrationIndex: Illustration = .first
		var emailState: CustomTextFieldState = .default

		var attributedText: AttributedString {
			var text = AttributedString("terms_and_conditions_info_note".localized)
			let highlights = [
				"terms_and_conditions".localized,
				"privacy_policy".localized
			]
			for phrase in highlights {
				if let range = text.range(of: phrase) {
					text[range].foregroundColor = .textPrimary
					text[range].underlineStyle = .none
					let captionSize = UIFont.preferredFont(forTextStyle: .caption1).pointSize
					text[range].font = .system(size: captionSize, weight: .semibold, design: .default)
				}
			}
			return text
		}

		var email: String = ""
		var isValidEmail: Bool = false

		let steps: [CarrouselModel]
		var onAction: (ActionType) -> Void

		init(onAction: @escaping (ActionType) -> Void) {
			self.onAction = onAction
			self.steps = Array(1...3).map {
				CarrouselModel(
					title: "auth_card_carrousel_\($0)_title".localized
				)
			}
		}

		func updateIllustration(for index: Int) {
			illustrationIndex = Illustration(rawValue: index) ?? .first
		}

		func validateEmail() {
			isValidEmail = isEmailValid()
		}

		private func isEmailValid() -> Bool {
			if email.isEmpty {
				emailState = .default
				return false
			}

			if email.isMatch(with: RegexHelper.email) {
				emailState = .confirmed
				return true
			}
			emailState = .error("invalid_email".localized)
			return false
		}

		func handleAction(with action: ActionType) {
			switch action {
				case .onContinue:
					UserDefaults.userEmail = email

					guard UserDefaults.isFirstLaunch else {
						onAction(.onContinue)
						return
					}
					return onAction(.onAuthenticate)
				default:
					break
			}
		}
	}
}
