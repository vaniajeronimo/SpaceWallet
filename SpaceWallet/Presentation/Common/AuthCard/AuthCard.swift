//
//  AuthCard.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

public struct AuthCard: View {

	@Bindable private var viewModel = ViewModel()
	@FocusState private var hasFocus: Bool

	private let onAction: (ActionType) -> Void

	public init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		content
	}

	private var content: some View {
		VStack {
			VStack(alignment: .center, spacing: UI.Spacing.level05) {
				promotionalText
				textField
				cta
				signInText
				socialLoginButtons
				termsAndConditionsText
			}
			.padding(.horizontal, 20)
			.padding(.bottom, 20)
		}
		.dismissKeyboard {
			viewModel.validateEmail()
		}
		.frame(width: 343, height: 428)
		.background(Color.white.blur(radius: 20))
		.clipShape(RoundedRectangle(cornerRadius: 40))
		.overlay(
			RoundedRectangle(cornerRadius: 40)
				.stroke(Color.white, lineWidth: 1)
		)
	}

	private var promotionalText: some View {
		Carrousel(
			data: viewModel.steps
		) { index in
			onAction(.onNewIndex(index))
		}
	}

	private var textField: some View {
		CustomTextField(
			title: "email_address".localized,
			text: $viewModel.email
		)
		.state(viewModel.emailState)
		.showClearButton(true)
		.focused($hasFocus)
		.submitLabel(.done)
		.textInputAutocapitalization(.never)
		.textContentType(.emailAddress)
		.onSubmit {
			viewModel.validateEmail()
		}
	}

	private var cta: some View {
		Button {
			viewModel.validateEmail()

			if viewModel.isValidEmail {
				onAction(.onContinue)
			}
		} label: {
			Text("continue".localized)
		}
		.disabled(!viewModel.isValidEmail)
		.buttonStyle(PrimaryButton(.medium))
	}

	private var signInText: some View {
		HStack(alignment: .center, spacing: UI.Spacing.level02) {
			Divider().custom()

			Text("or_sign_in_with".localized)
				.font(.heading5)
				.foregroundStyle(.textTertiary)

			Divider().custom()
		}
	}

	private var socialLoginButtons: some View {
		HStack(spacing: UI.Spacing.level05) {
			socialLoginButton(
				image: .apple,
				label: "Apple",
				action: { onAction(.onAppleLogin) }
			)
			socialLoginButton(
				image: .google,
				label: "Google",
				action: { onAction(.onGoogleLogin) }
			)
		}
	}

	@ViewBuilder
	private func socialLoginButton(image: ImageResource, label: String, action: @escaping () -> Void) -> some View {
		Button(action: action) {
			HStack(spacing: UI.Spacing.level03) {
				Image(image)
					.resizable()
					.frame(width: 24, height: 24)
					.scaledToFit()
				Text(label)
					.font(.heading4SemiBold)
					.foregroundStyle(.textPrimary)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
		}
		.frame(width: 143, height: 48)
		.background(.fillTertiary)
		.cornerRadius(UI.Corner.m)
	}

	private var termsAndConditionsText: some View {
		Text(viewModel.attributedText)
			.font(.caption)
			.foregroundStyle(.grayPrimary)
			.multilineTextAlignment(.center)
			.padding(.bottom, -UI.Spacing.level02)
	}
}

public extension AuthCard {

	enum ActionType {
		case onContinue
		case onNewIndex(Int)
		case onAppleLogin
		case onGoogleLogin
	}
}
