//
//  VerificationCodeScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 08/07/2025.
//

import SwiftUI

public struct VerificationCodeScreen: View {

	private var viewModel = ViewModel()
	private let onAction: (ActionType) -> Void

	@State private var text: String = ""

	public init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetSecondary

			VStack {
				navBar
				verification

				// TODO: Improve this
				Color.clear
					.frame(height: 60)
			}
			.setCardView()
			.keyboardAware()
			.padding(.horizontal, UI.Spacing.level07)
		}
		.ignoresSafeArea(edges: .all)
		.onAppear {
			viewModel.startTimer()
		}
		.onDisappear {
			viewModel.timer?.invalidate()
		}
		.dismissKeyboard()
	}

	private var navBar: some View {
		HStack(alignment: .center) {
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

			Spacer()

			Text("verification_code_title".localized)
				.font(.heading2Bold)

			Spacer()
		}
	}

	@ViewBuilder
	private var verification: some View {
		VStack(alignment: .center, spacing: 24) {
			Image.onboarding_dialog
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)

			VStack(alignment: .center, spacing: 16) {
				Text(viewModel.attributedString)
					.multilineTextAlignment(.center)

				DigitFields {
					onAction(.onContinue)
				}

				Text("verification_code_counter".localized(with: viewModel.remainingSeconds))
					.font(.heading5)
					.multilineTextAlignment(.center)
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
