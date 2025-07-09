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

	private let onAction: () -> Void

	public init(onAction: @escaping () -> Void) {
		self.onAction = onAction
		self.viewModel = .init()
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetSecondary

			VStack {
				title
				createPassword
			}
			.setCardView()
			.keyboardAware(offset: 190)
			.padding(.horizontal, UI.Spacing.level07)
		}
		.ignoresSafeArea(edges: .all)
		.dismissKeyboard()
	}

	private var title: some View {
		HStack(alignment: .center) {
			Spacer()
			Text("create_password_title".localized)
				.font(.heading2Bold)
			Spacer()
		}
	}

	@ViewBuilder
	private var createPassword: some View {
		VStack(alignment: .center, spacing: UI.Spacing.level07) {
			Image.onboarding_locker
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)

			VStack(alignment: .leading, spacing: UI.Spacing.level03) {
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
						viewModel.validatePassword()
					}
				)
				.state(viewModel.passwordState)
				.showClearButton(true)
				.isSecure(true)
				.focused($hasFocus)
				.submitLabel(.done)
				.textInputAutocapitalization(.never)
				.textContentType(.password)
			}

			Button {
				print("action")
			} label: {
				Text("create_password_title".localized)
			}
			.buttonStyle(PrimaryButton(.large))
			.disabled(true)
		}
		.padding(.top, UI.Spacing.level10)
	}
}
