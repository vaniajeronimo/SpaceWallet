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
			LinearGradient.violetPrimary
				.ignoresSafeArea(edges: .all)

			VStack(spacing: UI.Spacing.level05) {
				navBar
				ScrollView {
					content
				}
				cta
			}
			.padding(.horizontal, UI.Spacing.level07)
		}
	}

	private var navBar: some View {
		HStack(alignment: .center) {
			Button {
				onAction(.back)
			} label: {
				Image.close_dark
					.resizable()
					.scaledToFit()
					.frame(width: 24, height: 24)
			}

			Spacer()

			Button {
				print("question mark tapped")
			} label: {
				Image.info
					.resizable()
					.scaledToFit()
					.frame(width: 24, height: 24)
			}
		}
		.padding(.bottom, 34)
	}

	private var content: some View {
		VStack(spacing: UI.Spacing.level03) {
			Text("wallet_customization_title" .localized)
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
				ForEach(viewModel.colorList) { palette in
					let isSelected = palette.id == viewModel.selectedColor?.id

					Circle()
						.fill(palette.color)
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
			if let walletColor = viewModel.selectedColor {
				onAction(.next(walletColor))
			}
		} label: {
			Text("next".localized)
		}
		.buttonStyle(PrimaryButton(.large))
		.padding(.bottom, UI.Spacing.level06)
		.disabled(viewModel.selectedColor == nil)
	}
}

public extension WalletSetupScreen {

	enum ActionType {
		case next(WalletColorModel)
		case back
	}
}
