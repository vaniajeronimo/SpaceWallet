//
//  WalletSettingsScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 24/07/2025.
//

import SwiftUI

public struct WalletSettingsScreen: View {

	private var viewModel: ViewModel
	private let onAction: (ActionType) -> Void

	private let columns: [GridItem] = [
		GridItem(.flexible(), spacing: UI.Spacing.level05),
		GridItem(.flexible(), spacing: UI.Spacing.level05)
	]

	public init(
		onAction: @escaping (ActionType) -> Void
	) {
		self.onAction = onAction
		self.viewModel = .init(onAction: onAction)
	}

	public var body: some View {
		VStack {
			ScrollView(showsIndicators: false) {
				balanceCard
				cardCollection
			}
		}
		.padding(.top, UI.Spacing.level09)
		.padding(.horizontal, UI.Spacing.level06)
	}

	private var balanceCard: some View {
		ZStack {
			Image.pattern
				.frame(maxWidth: .infinity, maxHeight: .infinity)

			VStack(alignment: .leading, spacing: UI.Spacing.level04) {
				HStack {
					Text("cash_balance".localized)
						.font(.body)
						.fontWeight(.medium)
						.foregroundStyle(.b0)

					Spacer()

					Button {
						onAction(.accountAndRouting)
					} label: {
						HStack(alignment: .center, spacing: UI.Spacing.level02) {
							Text("account_and_rounting".localized)
								.font(.caption)
								.fontWeight(.semibold)
								.foregroundStyle(.textQuaternary)

							Image.chevron_white
								.resizable()
								.scaledToFit()
								.frame(maxWidth: 20, maxHeight: 20)
						}
					}
				}

				Text("$86.54")
					.font(.displayBold)
					.foregroundStyle(.b0)
					.padding(.bottom, UI.Spacing.level07)

				HStack(alignment: .center, spacing: UI.Spacing.level05) {
					Button {
						onAction(.addCash)
					} label: {
						Text("add_cash_title".localized)
					}
					.buttonStyle(PrimaryButton(.small, color: .b0, titleColor: .textPrimary))

					Button {
						onAction(.cashOut)
					} label: {
						Text("cash_out_title".localized)
					}
					.buttonStyle(PrimaryButton(.small, color: .b0, titleColor: .textPrimary))
				}
				.frame(maxWidth: .infinity, alignment: .center)
			}
			.padding(UI.Spacing.level05)
		}
		.frame(maxWidth: .infinity, maxHeight: 250)
		.background(Color.textPrimary)
		.clipShape(RoundedRectangle(cornerRadius: UI.Corner.l))
	}

	private var cardCollection: some View {
		LazyVGrid(columns: columns, spacing: UI.Spacing.level05) {
			ForEach(viewModel.cardsData, id: \.id) { card in
				createCardView(
					mainTitle: card.mainTitle,
					image: card.image,
					title: card.title,
					subtitle: card.subtitle,
					onAction: card.action
				)
			}
		}
		.padding(.top, UI.Spacing.level07)
	}

	private func createCardView(
		mainTitle: String,
		image: Image,
		title: String,
		subtitle: String,
		onAction: (() -> Void)? = nil)
	-> some View {
		HStack {
			VStack(alignment: .leading, spacing: UI.Spacing.level05) {
				HStack {
					Text(mainTitle)
						.font(.body)
						.fontWeight(.medium)
						.foregroundStyle(.textSecondary)

					Spacer()

					Image.ic_chevron_outline
						.resizable()
						.scaledToFit()
						.frame(maxWidth: 20, maxHeight: 20)
				}
				image
					.resizable()
					.scaledToFit()
					.frame(maxWidth: 80, maxHeight: 80)

				VStack(spacing: .zero) {
					Text(title)
						.font(.heading3Bold)
						.foregroundStyle(.textPrimary)

					Text(subtitle)
						.font(.caption)
						.fontWeight(.semibold)
						.foregroundStyle(.textPrimary)
				}
			}
			.onTapGesture {
				onAction?()
			}
		}
		.padding(UI.Spacing.level05)
		.frame(maxWidth: .infinity, maxHeight: 200)
		.background(Color.fillQuaternary)
		.clipShape(RoundedRectangle(cornerRadius: UI.Corner.l))
	}
}

public extension WalletSettingsScreen {

	enum ActionType {
		case addCash
		case cashOut
		case accountAndRouting
		case savings
		case buyBitcoin
		case research
		case autoInvest
	}
}
