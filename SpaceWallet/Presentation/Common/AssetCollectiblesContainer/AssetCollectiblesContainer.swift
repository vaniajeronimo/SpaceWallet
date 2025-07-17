//
//  AssetsCollectiblesContainer.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public struct AssetCollectiblesContainer: View {

	@State private var isAssetsSelected: Bool = true
	@State private var isCollectiblesSelected: Bool = false

	public var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			buttons

			if isAssetsSelected {
				assets
			} else {
				collectibles
			}
		}
		.padding(20)
		.frame(maxWidth: .infinity, alignment: .center)
		.background(
			Color.white.opacity(0.6)
				.blur(radius: 20)
		)
		.clipShape(RoundedRectangle(cornerRadius: 40))
		.overlay(
			RoundedRectangle(cornerRadius: 40)
				.stroke(Color.white, lineWidth: 1)
		)
		.padding(.top, 32)
	}

	private var buttons: some View {
		HStack(spacing: 24) {
			Button {
				isAssetsSelected = true
				isCollectiblesSelected = false
			} label: {
				Text("Asset")
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundStyle(isAssetsSelected ? .textPrimary : .textTertiary)
			}

			Button {
				isAssetsSelected = false
				isCollectiblesSelected = true
			} label: {
				Text("Collectibles")
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundStyle(isCollectiblesSelected ? .textPrimary : .textTertiary)
			}
		}
		.padding(.top, 5)
	}

	private var assets: some View {
		VStack(alignment: .center, spacing: UI.Spacing.level04) {
			ZStack(alignment: .top) {
				Image.container_view
					.resizable()
					.scaledToFit()
					.frame(height: 72)

				Image.coin_container
					.resizable()
					.scaledToFit()
					.frame(width: 67, height: 63)
					.padding(.top, 30)
					.background(
						Color.white.opacity(0.95)
							.blur(radius: 20)
					)
			}

			VStack(alignment: .center, spacing: UI.Spacing.level02) {
				Text("buy_crypto".localized)
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundStyle(.textPrimary)
				Text("buy_crypto_with_card".localized)
					.font(.body)
					.fontWeight(.medium)
					.foregroundStyle(.textSecondary)
			}
		}
	}

	private var collectibles: some View {
		Image.space_monkey
			.resizable()
			.scaledToFit()
			.frame(height: 364)
			.padding(.bottom, 20)
	}
}
