//
//  AuthCard.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

public struct AuthCard: View {

	private var viewModel = ViewModel()

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
				cta
				signInText
				socialLoginButtons
				termsAndConditionsText
			}
			.padding(20)
		}
		.frame(width: 343, height: 408)
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
		.padding(.bottom, UI.Spacing.level08)
	}

	private var cta: some View {
		Button {
			onAction(.onContinue)
		} label: {
			Text("continue".localized)
		}
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
		.background(Color.fillTertiary)
		.cornerRadius(12)
	}

	private var termsAndConditionsText: some View {
		Text(viewModel.attributedText)
			.font(.caption)
			.foregroundStyle(.grayPrimary)
			.multilineTextAlignment(.center)
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
