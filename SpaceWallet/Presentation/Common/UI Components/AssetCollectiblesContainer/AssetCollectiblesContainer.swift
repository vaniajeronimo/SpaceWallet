//
//  AssetsCollectiblesContainer.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public struct AssetCollectiblesContainer: View {

	@State private var selectedTab: Tab = .assets

	private var nfts: [CollectibleModel]?
	private var hasNoAssets: Bool

	public init(nfts: [CollectibleModel]? = nil, hasNoAssets: Bool = true) {
		self.nfts = nfts
		self.hasNoAssets = hasNoAssets
	}

	public var body: some View {
		VStack(alignment: .leading, spacing: UI.Spacing.level05) {
			tabButtons

			switch screenState {
				case .assetsEmpty:
					assetsEmptyView
				case .assetsAvailable:
					assets
				case .collectiblesAvailable:
					collectibles
				case .collectiblesEmpty:
					collectiblesEmptyView
			}
		}
		.padding(UI.Spacing.level06)
		.frame(maxWidth: .infinity, alignment: .center)
		.background(
			Color.white.opacity(0.8)
				.blur(radius: 10)
		)
		.clipShape(RoundedRectangle(cornerRadius: UI.Corner.xxxl))
		.overlay(RoundedRectangle(cornerRadius: UI.Corner.xxxl).stroke(Color.white, lineWidth: UI.Border.s))
		.padding(.top, UI.Spacing.level08)
	}

	private var tabButtons: some View {
		HStack(spacing: UI.Spacing.level07) {
			Button {
				selectedTab = .assets
			} label: {
				Text("assets".localized)
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundStyle(selectedTab == .assets ? .textPrimary : .textTertiary)
			}

			Button {
				selectedTab = .collectibles
			} label: {
				Text("collectibles".localized)
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundStyle(selectedTab == .collectibles ? .textPrimary : .textTertiary)
			}
		}
		.padding(.top, 5)
		.padding(.horizontal, UI.Spacing.level06)
		.frame(maxWidth: .infinity, alignment: .leading)
	}

	private var assets: some View {
		EmptyView()
	}

	private var collectibles: some View {
		VStack(spacing: .zero) {
			if let collectibles = nfts, collectibles.isNotEmpty {

				collectibles.first?.image
					.resizable()
					.scaledToFit()
					.frame(maxHeight: 364)
					.padding(.bottom, UI.Spacing.level03)

				let remaining = Array(collectibles.dropFirst())

				HStack {
					LazyVGrid(
						columns: [
							GridItem(.flexible(), spacing: UI.Spacing.level03),
							GridItem(.flexible(), spacing: UI.Spacing.level03)
						],
						spacing: UI.Spacing.level03
					) {
						ForEach(remaining, id: \.name) { item in
							item.image
								.resizable()
								.scaledToFit()
								.frame(maxWidth: 163.5, maxHeight: 168)
						}
					}
				}
				.padding(.horizontal, UI.Spacing.level06)
			}
		}
		.padding(.bottom, UI.Spacing.level06)
	}

	private var assetsEmptyView: some View {
		VStack(alignment: .center) {
			ZStack(alignment: .top) {
				Image.container_view
					.resizable()
					.scaledToFit()
					.frame(maxWidth: 335, maxHeight: 72)

				VStack(alignment: .center, spacing: UI.Spacing.level02) {
					Image.coin_container
						.resizable()
						.scaledToFit()
						.frame(maxWidth: 67, maxHeight: 63)
						.padding(.top, 30)
						.padding(.bottom, UI.Spacing.level02)

					Text("buy_crypto".localized)
						.font(.heading4)
						.fontWeight(.medium)
						.foregroundStyle(.textPrimary)
					Text("buy_crypto_with_card".localized)
						.font(.body)
						.fontWeight(.medium)
						.foregroundStyle(.textSecondary)

					Button {
						print("buy crypto tapped")
					} label: {
						Text("buy".localized)
					}
					.buttonStyle(PrimaryButton(.medium))
					.padding(.top, UI.Spacing.level06)
				}
				.multilineTextAlignment(.center)
				.background(
					Color.white.opacity(0.60)
						.blur(radius: 20)
				)
			}
		}
		.padding(.top, UI.Spacing.level05)
		.frame(maxWidth: .infinity, alignment: .center)
	}

	private var collectiblesEmptyView: some View {
		VStack(alignment: .center) {
			ZStack(alignment: .top) {
				Image.no_collection
					.resizable()
					.scaledToFit()
					.frame(maxWidth: 294, maxHeight: 135)

				VStack(alignment: .center, spacing: UI.Spacing.level02) {
					Image.folder
						.resizable()
						.scaledToFit()
						.frame(maxWidth: 64, maxHeight: 50.29)
						.padding(.top, 30)
						.padding(.bottom, UI.Spacing.level02)

					Text("no_collection_title".localized)
						.font(.heading4)
						.fontWeight(.medium)
						.foregroundStyle(.textPrimary)
					Text("no_collection_subtitle".localized)
						.font(.body)
						.fontWeight(.medium)
						.foregroundStyle(.textSecondary)
				}
				.multilineTextAlignment(.center)
				.background(
					Color.white.opacity(0.60)
						.blur(radius: 20)
				)
			}
		}
		.padding(.top, UI.Spacing.level05)
		.frame(maxWidth: .infinity, alignment: .center)
	}
}

extension AssetCollectiblesContainer {

	private enum Tab {
		case assets
		case collectibles
	}

	private enum ScreenState {
		case assetsEmpty
		case assetsAvailable
		case collectiblesEmpty
		case collectiblesAvailable
	}

	private var screenState: ScreenState {
		switch selectedTab {
			case .assets:
				return hasNoAssets ? .assetsEmpty : .assetsAvailable
			case .collectibles:
				guard let nfts, nfts.isNotEmpty else {
					return .collectiblesEmpty
				}
				return .collectiblesAvailable
		}
	}
}
