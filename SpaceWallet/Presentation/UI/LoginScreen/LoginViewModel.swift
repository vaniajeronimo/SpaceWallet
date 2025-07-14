//
//  LoginViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 04/07/2025.
//

import Combine
import Factory
import SwiftData
import SwiftUI

extension LoginScreen {
	@Observable
	@MainActor
	final class ViewModel {

		@ObservationIgnored
		@Injected(\.checkFirstLaunchUseCase)
		private var checkFirstLaunchUseCase

		@ObservationIgnored
		@Injected(\.getAccountUseCase)
		private var getAccountUseCase

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

		private var modelContext: ModelContext?
		private var cancellables = Set<AnyCancellable>()

		init(onAction: @escaping (ActionType) -> Void) {
			self.onAction = onAction
			self.steps = Array(1...3).map {
				CarrouselModel(
					title: "auth_card_carrousel_\($0)_title".localized
				)
			}
		}

		func setContext(_ context: ModelContext) {
			self.modelContext = context
		}

		func updateIllustration(for index: Int) {
			illustrationIndex = Illustration(rawValue: index) ?? .first
		}

		func validateEmail(isToCheckEmail: Bool = false) {
			isValidEmail = isEmailValid()

			if isValidEmail && isToCheckEmail {
				checkIfAccountExists()
			}
		}

		private func checkIfAccountExists() {
			guard let modelContext else { return }

			let firstLaunchPublisher = checkFirstLaunchUseCase.execute()
				.replaceError(with: false)
			let accountPublisher = getAccountUseCase.execute(email: email, context: modelContext)
				.map { _ in true }
				.catch { _ in Just(false) }

			Publishers.Zip(firstLaunchPublisher, accountPublisher)
				.receive(on: DispatchQueue.main)
				.sink { completion in
					switch completion {
						case .failure(let error):
							Debug.error(error)
						case .finished:
							break
					}
				} receiveValue: { [weak self] isFirstLaunch, accountExists in
					guard let self else { return }

					if isFirstLaunch && !accountExists {
						onAction(.onboarding)
					} else {
						onAction(.verificationCode)
					}
				}
				.store(in: &cancellables)
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
	}
}
