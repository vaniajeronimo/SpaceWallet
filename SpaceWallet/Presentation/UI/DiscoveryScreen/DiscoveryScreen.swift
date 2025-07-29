//
//  DiscoveryScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

struct DiscoveryScreen: View {

	private var viewModel: ViewModel = ViewModel()

	init() { }

	var body: some View {
		content
	}

	private var content: some View {
		VStack(spacing: UI.Spacing.level07) {
			VStack(alignment: .leading, spacing: UI.Spacing.level04) {
				Search(placeholder: "discovery_search_bar_placeholder".localized)
					.style(.init(size: .m, state: .withStroke))
				filterButtons
			}
			ScrollView {
				nfts
			}
		}
		.padding(.top, UI.Spacing.level07)
	}

	private var filterButtons: some View {
		HStack(alignment: .center, spacing: UI.Spacing.level04) {
			createFilterButton(title: "discovery_tokens".localized, action: {
				print("Filter by tokens")
			})
			createFilterButton(title: "discovery_sites".localized, action: {
				print("Filter by sites")
			})
			createFilterButton(title: "discovery_learn".localized, action: {
				print("Filter by learn")
			})
		}
		.padding(.horizontal, UI.Spacing.level06)
	}

	private func createFilterButton(title: String, action: @escaping () -> Void) -> some View {
		Button {
			action()
		} label: {
			Text(title)
				.font(.heading4)
				.foregroundStyle(.textPrimary)
				.padding(.vertical, 5.5)
				.padding(.horizontal, 9.5)
				.background(
					RoundedRectangle(cornerRadius: UI.Corner.s)
						.fill(Color.strokeSecondary)
				)
		}
	}

	private var nfts: some View {
		VStack(spacing: .zero) {
			viewModel.nfts.first?.image
				.resizable()
				.scaledToFit()
				.frame(maxHeight: .infinity)
				.clipShape(RoundedRectangle(cornerRadius: UI.Corner.l))
				.padding(.bottom, UI.Spacing.level03)

			let remaining = Array(viewModel.nfts.dropFirst())

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
