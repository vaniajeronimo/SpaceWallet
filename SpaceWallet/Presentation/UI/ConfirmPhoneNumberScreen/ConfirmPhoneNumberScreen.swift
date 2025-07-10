//
//  ConfirmPhoneNumberScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

public struct ConfirmPhoneNumberScreen: View {

	@Bindable var viewModel: ViewModel
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
				confirmPhoneNumber
			}
			.setCardView()
			.keyboardAware(offset: 190)
			.padding(.horizontal, UI.Spacing.level07)

			countriesBottomSheet
		}
		.ignoresSafeArea(edges: .all)
		.dismissKeyboard()
	}

	private var title: some View {
		Text("confirm_phone_number_title".localized)
			.font(.heading2Bold)
	}

	@ViewBuilder
	private var confirmPhoneNumber: some View {
		VStack(alignment: .center, spacing: UI.Spacing.level07) {
			Image.onboarding_mobile
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)

			VStack(alignment: .leading, spacing: UI.Spacing.level03) {
				textField
			}
			cta
		}
		.padding(.top, UI.Spacing.level10)
	}

	@ViewBuilder
	private var textField: some View {
		Text("confirm_phone_number_subtitle".localized)
			.font(.heading5)
			.multilineTextAlignment(.leading)

		CustomTextField(
			title: "phone_number".localized,
			text: $viewModel.phoneNumber,
			onClearAction: {
				viewModel.clearPhoneNumber()
			},
			onPrefixTap: {
				viewModel.isToShowBottomSheet = true
			}
		)
		.state(.default)
		.showClearButton(true)
		.isPhoneNumberField(true, prefix: viewModel.prefix)
		.focused($hasFocus)
		.submitLabel(.done)
		.textInputAutocapitalization(.never)
		.textContentType(.telephoneNumber)
	}

	private var cta: some View {
		Button {
			UserDefaults.userPhoneNumber = viewModel.userPhoneNumber
			onAction()
		} label: {
			Text("continue".localized)
		}
		.buttonStyle(PrimaryButton(.large))
		.disabled(viewModel.disableCta)
		.padding(.top, UI.Spacing.level07)
		.padding(.bottom, 18)
	}
}
