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

		var firstStepper: StepperColor = .notSet
		var secondStepper: StepperColor = .notSet
		var thirdStepper: StepperColor = .notSet

		var passwordStrength: StepperColor = .notSet

		var hintText: String {
			passwordStrength.description
		}

		init() { }

		func validatePassword() {
			guard password.isNotEmpty else {
				passwordStrength = .notSet
				updateSteppers(for: .notSet)
				return
			}

			guard password.count >= 6 else {
				passwordStrength = .weak
				updateSteppers(for: .weak)
				return
			}

			if passwordContainsNumberOrSymbol(password) {
				passwordStrength = .strong
				updateSteppers(for: .strong)
				return
			}

			passwordStrength = .average
			updateSteppers(for: .average)
			return
		}

		private func updateSteppers(for strength: StepperColor) {
			switch strength {
				case .strong:
					firstStepper = .strong
					secondStepper = .strong
					thirdStepper = .strong
				case .average:
					firstStepper = .average
					secondStepper = .average
					thirdStepper = .notSet
				case .weak:
					firstStepper = .weak
					secondStepper = .notSet
					thirdStepper = .notSet
				case .notSet:
					firstStepper = .notSet
					secondStepper = .notSet
					thirdStepper = .notSet
			}
		}

		func clearPassword() {
			password = ""
			passwordStrength = .notSet
			updateSteppers(for: .notSet)
		}

		private func passwordContainsNumberOrSymbol(_ password: String) -> Bool {
			let regex = try? NSRegularExpression(pattern: RegexHelper.password)
			let range = NSRange(password.startIndex..., in: password)
			return regex?.firstMatch(in: password, options: [], range: range) != nil
		}
	}
}

public extension CreatePasswordScreen {

	enum StepperColor: String {
		case notSet
		case weak
		case average
		case strong

		var description: String {
			switch self {
				case .weak:
					return "weak".localized
				case .average:
					return "average".localized
				case .strong:
					return "strong".localized
				case .notSet:
					return ""
			}
		}

		var color: Color {
			switch self {
				case .weak:
					return .redDefault
				case .average:
					return .yellowDefault
				case .strong:
					return .greenDefault
				case .notSet:
					return .grayQuaternary
			}
		}
	}
}
