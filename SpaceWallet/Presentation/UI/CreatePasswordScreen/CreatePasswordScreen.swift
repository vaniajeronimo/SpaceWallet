//
//  CreatePasswordScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import SwiftUI

public struct CreatePasswordScreen: View {

	@Bindable private var viewModel: ViewModel
	@FocusState private var hasFocus: Bool

	public init(onAction: @escaping () -> Void) {
		self.viewModel = .init(onAction: onAction)
	}

	public var body: some View {
		ZStack {
			VStack {
				title
				createPassword
			}
			.setCardView()
			.padding(.horizontal, UI.Spacing.level07)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(
			LinearGradient
				.violetPrimary
				.ignoresSafeArea(.all)
		)
		.alert(isPresented: $viewModel.isToShowAlert) {
			Alert(
				title: Text("generic_error_title".localized),
				message: Text("generic_error_message".localized),
				dismissButton: .default(Text("ok".localized), action: {
					viewModel.isToShowAlert = false
				})
			)
		}
		.keyboardAware()
		.dismissKeyboard()
	}

	private var title: some View {
		Text("create_password_title".localized)
			.font(.heading2Bold)
	}

	private var createPassword: some View {
		VStack(alignment: .center, spacing: UI.Spacing.level07) {
			Image.onboarding_locker
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)

			VStack(alignment: .leading, spacing: UI.Spacing.level03) {
				textField
				passwordStrenght
			}
			cta
		}
		.padding(.top, UI.Spacing.level10)
	}

	@ViewBuilder
	private var textField: some View {
		Text("create_password_subtitle".localized)
			.font(.heading5)
			.multilineTextAlignment(.leading)

		CustomTextField(
			title: "password".localized,
			text: $viewModel.password,
			onChange: { _ in
				viewModel.validatePassword()
			},
			onClearAction: {
				viewModel.clearPassword()
			}
		)
		.state(.default)
		.showClearButton(true)
		.isSecure(true)
		.focused($hasFocus)
		.submitLabel(.done)
		.textInputAutocapitalization(.never)
		.textContentType(.password)
	}

	private var passwordStrenght: some View {
		PasswordStrengthView(
			stepperColors: [
				viewModel.firstStepper.color,
				viewModel.secondStepper.color,
				viewModel.thirdStepper.color
			],
			hintText: viewModel.hintText,
			isStrong: viewModel.passwordStrength == .strong
		)
	}

	private var cta: some View {
		Button {
			viewModel.setSession()
		} label: {
			Text("create_password_title".localized)
		}
		.buttonStyle(PrimaryButton(.large))
		.disabled(viewModel.passwordStrength == .weak || viewModel.passwordStrength == .notSet)
		.padding(.bottom, 18)
	}
}
