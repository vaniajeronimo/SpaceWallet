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

	public init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetGradient2

			VStack {
				navBar
				image
			}
			.setCardView()
			.padding(.horizontal, UI.Spacing.level06)
		}
		.ignoresSafeArea(edges: .all)
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

	private var image: some View {
		VStack(alignment: .center, spacing: 24) {
			Image.onboarding_dialog
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)

			if let userEmail = UserDefaults.userEmail {
				Text("verification_code_subtitle".localized(with: userEmail))
					.font(.heading5SemiBold)
					.multilineTextAlignment(.center)
			}
		}
		.padding(.top, UI.Spacing.level10)
	}
}

extension VerificationCodeScreen {

	public enum ActionType {
		case onBack
		case onContinue
	}
}
