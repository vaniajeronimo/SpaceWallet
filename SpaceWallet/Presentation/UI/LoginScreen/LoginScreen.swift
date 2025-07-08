//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct LoginScreen: View {

	@Bindable private var viewModel: ViewModel
	@FocusState private var hasFocus: Bool
	@State private var isToShowAlert: Bool = false

	public init(onAction: @escaping (ActionType) -> Void) {
		self.viewModel = .init(onAction: onAction)
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetGradient2
				.ignoresSafeArea()

			ScrollView(showsIndicators: false) {
				VStack(alignment: .center, spacing: UI.Spacing.level06) {
					currentIllustration
					content
				}
				.padding(.horizontal, UI.Spacing.level06)
			}
		}
		.dismissKeyboard {
			viewModel.validateEmail()
		}
		.alert("generic_alert_title".localized, isPresented: $isToShowAlert) {
			Button("ok".localized, role: .cancel) {
				isToShowAlert = false
			}
		}
	}

	@ViewBuilder
	private var currentIllustration: some View {
		Image(viewModel.illustrationIndex.image)
			.resizable()
			.frame(width: 300, height: 300)
			.scaledToFit()
	}

	private var content: some View {
		VStack(alignment: .center, spacing: UI.Spacing.level05) {
			VStack(spacing: UI.Spacing.level06) {
				carrousel
				textField
			}
			cta
			signInText
			socialLoginButtons
			termsAndConditionsText
		}
		.setCardView()
		.frame(height: 450)
	}

	private var carrousel: some View {
		Carrousel(
			data: viewModel.steps
		) { index in
			viewModel.updateIllustration(for: index)
		}
		.frame(height: 80)
	}

	private var textField: some View {
		CustomTextField(
			title: "email_address".localized,
			text: $viewModel.email,
			onClearAction: {
				viewModel.validateEmail()
			}
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
				viewModel.handleAction(with: .onContinue)
			}
		} label: {
			Text("continue".localized)
		}
		.disabled(!viewModel.isValidEmail)
		.buttonStyle(PrimaryButton(.large))
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
				action: {
					isToShowAlert = true
				}
			)
			socialLoginButton(
				image: .google,
				label: "Google",
				action: {
					isToShowAlert = true
				}
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
		.frame(width: 143.5, height: 56)
		.background(.fillTertiary)
		.cornerRadius(UI.Corner.m)
	}

	private var termsAndConditionsText: some View {
		Text(viewModel.attributedText)
			.font(.caption)
			.foregroundStyle(.grayPrimary)
			.multilineTextAlignment(.center)
			.frame(height: 50)
	}
}

public extension LoginScreen {

	enum Illustration: Int {
		case first = 0
		case second
		case third

		var image: ImageResource {
			switch self {
				case .first: return .noOrderFound
				case .second: return .emptyCart
				case .third: return .noSearchFound
			}
		}
	}

	enum ActionType {
		case onContinue
		case onAuthenticate
		case onNewIndex(Int)
	}
}
