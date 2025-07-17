//
//  HomeScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftUI

public struct HomeScreen: View {

	@State private var isAssetsSelected: Bool = false
	@State private var isCollectiblesSelected: Bool = false

	private let viewModel: ViewModel

	public init(onAction: @escaping (ActionType) -> Void) {
		self.viewModel = .init(onAction: onAction)
	}

	public var body: some View {
		ZStack {
			viewModel.balanceColor.gradient
				.ignoresSafeArea(edges: .all)

			VStack {
				ScrollView(showsIndicators: false) {
					VStack {
						navBar
						balance
						actions
					}
					.padding(.horizontal, UI.Spacing.level06)

					assets
				}
			}
		}
	}

	private var navBar: some View {
		HStack(alignment: .center) {
			profileSettings
			Spacer()
			navBarActions
		}
		.padding(.top, UI.Spacing.level05)
	}

	@ViewBuilder
	private var profileSettings: some View {
		Image.profile
			.resizable()
			.frame(width: 36, height: 36)
			.scaledToFit()
			.contentShape(Circle())

		VStack(alignment: .leading) {
			Text(viewModel.userName)
				.font(.heading5SemiBold)
				.foregroundStyle(.textSecondary)
			HStack(alignment: .center, spacing: UI.Spacing.level02) {
				Text("Account1")
					.font(.heading5SemiBold)
					.foregroundStyle(.textPrimary)
				Button {
					viewModel.onAction(.settings)
				} label: {
					Image.chevronDown
						.resizable()
						.frame(width: 16, height: 16)
						.scaledToFit()
				}
			}
		}
	}

	private var navBarActions: some View {
		HStack(spacing: 18) {
			Button {
				viewModel.onAction(.qrCode)
			} label: {
				Image.qrCode
					.resizable()
					.frame(width: 24, height: 24)
					.scaledToFit()
			}
			Button {
				viewModel.onAction(.search)
			} label: {
				Image.search
					.resizable()
					.frame(width: 24, height: 24)
					.scaledToFit()
			}
		}
	}

	private var balance: some View {
		VStack(alignment: .center, spacing: UI.Spacing.level02) {
			Text("$\(viewModel.formattedBalance)")
				.font(.displayBigBold)
				.foregroundStyle(.textPrimary)

			HStack(spacing: UI.Spacing.level02) {
				Text(viewModel.profitValue)
					.font(.heading5SemiBold)
					.foregroundStyle(.textTertiary)
				Text("+0.00%")
					.font(.caption)
					.fontWeight(.semibold)
					.foregroundStyle(.textTertiary)
			}
		}
		.padding(.top, UI.Spacing.level05)
	}

	private var actions: some View {
		HStack(spacing: 13.26) {
			ForEach(viewModel.actions) { action in
				ActionCard(model: action)
			}
		}
		.padding(.top, UI.Spacing.level07)
		.padding(.horizontal, UI.Spacing.level06)
	}

	private var assets: some View {
		AssetCollectiblesContainer()
	}
}

public extension HomeScreen {

	enum ActionType {
		case receive
		case send
		case swap
		case buy
		case settings
		case qrCode
		case search
	}

	enum BalanceColor {
		case positive
		case negative
		case neutral

		var gradient: LinearGradient {
			switch self {
				case .positive:
					return .greenSecondary
				case .negative:
					return .redPrimary
				case .neutral:
					return .violetPrimary
			}
		}
	}
}
