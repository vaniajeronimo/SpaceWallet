//
//  VerificationCodeScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 08/07/2025.
//

import SwiftUI

public struct VerificationCodeScreen: View {

	private var viewModel: ViewModel
	private let onAction: (ActionType) -> Void

	@State private var text: String = ""
	@State private var isOnboardingFlow: Bool

	public init(
		isOnboardingFlow: Bool = false,
		onAction: @escaping (ActionType) -> Void
	) {
		self.isOnboardingFlow = isOnboardingFlow
		self.onAction = onAction
		self.viewModel = .init(isOnboardingFlow: isOnboardingFlow)
	}

	public var body: some View {
		Group {
			VStack {
				navBar
				verification

				// TODO: Improve this
				Color.clear
					.frame(height: 60)
			}
			.setCardView()
			.padding(.horizontal, UI.Spacing.level07)
		}
		.dismissKeyboard()
		.keyboardAware()
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(
			LinearGradient.violetSecondary
				.ignoresSafeArea(.all)
		)
		.onAppear {
			viewModel.startTimer()
		}
		.onDisappear {
			viewModel.timer?.invalidate()
		}
	}

	private var navBar: some View {
		HStack(alignment: .center) {
			if !isOnboardingFlow {
				backButton
			}
			Spacer()

			Text("verification_code_title".localized)
				.font(.heading2Bold)

			Spacer()
		}
	}

	private var backButton: some View {
		Button {
			onAction(.onBack)
		} label: {
			ZStack {
				Circle()
					.fill(.fillTertiary)

				Image.chevronLeft
					.resizable()
					.scaledToFit()
					.frame(width: 24, height: 24)
					.foregroundColor(.textPrimary)
			}
			.frame(width: 40, height: 40)
		}
		.contentShape(Circle())
	}

	@ViewBuilder
	private var verification: some View {
		VStack(alignment: .center, spacing: 24) {
			Image.onboarding_dialog
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)

			VStack(alignment: .center, spacing: 16) {
				Text(viewModel.attributedTextString)
					.multilineTextAlignment(.center)

				DigitFields {
					onAction(.onContinue)
				}

				if isOnboardingFlow {
					Button {
						viewModel.getNewCode()
					} label: {
						Text("get_a_new_code".localized)
							.font(.heading5SemiBold)
							.foregroundStyle(.violetHover)
							.multilineTextAlignment(.center)
					}
				} else {
					Text("verification_code_counter".localized(with: viewModel.remainingSeconds))
						.font(.heading5)
						.multilineTextAlignment(.center)
				}
			}
		}
		.padding(.top, UI.Spacing.level10)
	}

	private var background: some View {
		RoundedRectangle(cornerRadius: UI.Corner.s)
			.stroke(lineWidth: UI.Border.m)
			.foregroundStyle(.fillSecondary)
			.background(
				RoundedRectangle(cornerRadius: UI.Corner.s)
					.fill(.b1)
			)
	}
}

extension VerificationCodeScreen {

	public enum ActionType {
		case onBack
		case onContinue
	}
}
