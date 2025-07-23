//
//  WalletSetupScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 11/07/2025.
//

import SwiftUI

public struct WalletSetupScreen: View {

	private var viewModel = ViewModel()
	private let onAction: (ActionType) -> Void

	public init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		ZStack {
			VStack(spacing: UI.Spacing.level05) {
				Spacer(minLength: 34.86)

				ScrollView {
					content
				}
				cta
			}
			.padding(.horizontal, UI.Spacing.level07)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(
			LinearGradient.violetPrimary
				.ignoresSafeArea(.all)
		)
	}

	private var content: some View {
		VStack(spacing: UI.Spacing.level03) {
			Text("wallet_customization_title".localized)
				.font(.heading1Bold)
				.foregroundStyle(.textPrimary)
			Text("wallet_customization_subtitle".localized)
				.font(.body)
				.fontWeight(.medium)
				.foregroundStyle(.textSecondary)

			Spacer(minLength: 100)

			colorPicker
		}
		.multilineTextAlignment(.center)
	}

	private var colorPicker: some View {
		VStack {
			LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 28), count: 3), spacing: 28) {
				ForEach(viewModel.colorList, id: \.id) { palette in
					let isSelected = palette.id == viewModel.selectedColor?.id

					Circle()
						.fill(Color(palette.color))
						.frame(width: 64, height: 64)
						.overlay {
							if isSelected {
								Circle()
									.stroke(Color.white, lineWidth: 2)
									.frame(width: 68, height: 68)
							}
						}
						.overlay {
							if isSelected {
								Circle()
									.stroke(Color.violet_stroke, lineWidth: 4)
									.frame(width: 76, height: 76)
							}
						}
						.contentShape(Circle())
						.onTapGesture {
							viewModel.selectedColor = palette
						}
				}
			}
			Spacer(minLength: 117)

			Text("wallet_customization_footer".localized)
				.font(.footnote)
				.fontWeight(.medium)
				.foregroundStyle(.textSecondary)
				.multilineTextAlignment(.center)
		}
		.padding(.horizontal, 36)
	}

	private var cta: some View {
		Button {
			if let wallet = viewModel.selectedColor {
				onAction(.next(wallet))
			}
		} label: {
			Text("next".localized)
		}
		.buttonStyle(PrimaryButton(.large))
		.padding(.top, UI.Spacing.level05)
		.padding(.bottom, UI.Spacing.level06)
		.disabled(viewModel.selectedColor == nil)
	}
}

public extension WalletSetupScreen {

	enum ActionType {
		case next(WalletModel)
		case back
	}
}
