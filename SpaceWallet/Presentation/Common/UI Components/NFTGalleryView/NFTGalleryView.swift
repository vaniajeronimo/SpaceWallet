//
//  NFTGalleryView.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

public struct NFTGalleryView: View {

	let nfts: [CollectibleModel]

	public var body: some View {
		VStack(spacing: .zero) {
			if let first = nfts.first {
				first.image
					.resizable()
					.scaledToFit()
					.frame(maxHeight: .infinity)
					.clipShape(RoundedRectangle(cornerRadius: UI.Corner.l))
					.padding(.bottom, UI.Spacing.level03)
			}

			let remaining = Array(nfts.dropFirst())

			HStack {
				LazyVGrid(
					columns: [
						GridItem(.flexible(), spacing: UI.Spacing.level03),
						GridItem(.flexible(), spacing: UI.Spacing.level03)
					],
					spacing: UI.Spacing.level03
				) {
					ForEach(remaining) { item in
						item.image
							.resizable()
							.scaledToFit()
							.frame(maxWidth: .infinity)
							.clipShape(RoundedRectangle(cornerRadius: UI.Corner.l))
					}
				}
			}
		}
		.padding(.horizontal, UI.Spacing.level07)
		.padding(.bottom, UI.Spacing.level06)
	}
}
