//
//  DiscoveryScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

struct DiscoveryScreen: View {

	@Bindable private var viewModel = ViewModel()
	@FocusState private var searchIsFocused: Bool
	@State private var showAll: Bool = false

	init() { }

	var body: some View {
		VStack(spacing: UI.Spacing.level07) {
			VStack(alignment: .leading, spacing: UI.Spacing.level04) {
				Search(
					placeholder: "search_bar_placeholder".localized,
					searchString: $viewModel.searchString
				)
				.style(.init(size: .m, state: .withStroke))
				.focused($searchIsFocused)
				filterButtons
			}
			content
		}
		.padding(.top, UI.Spacing.level07)
		.onTapGesture {
			searchIsFocused = false
		}
	}

	private var content: some View {
		ScrollView {
			switch viewModel.screenState {
				case .nfts:
					nfts
				case .tokens:
					trendingTokens
			}
		}
	}

	private var filterButtons: some View {
		HStack(alignment: .center, spacing: UI.Spacing.level04) {
			createFilterButton(
				title: "discovery_nfts".localized,
				isSelected: viewModel.selectedTab == .nfts,
				action: {
					viewModel.selectedTab = .nfts
				}
			)
			createFilterButton(
				title: "discovery_tokens".localized,
				isSelected: viewModel.selectedTab == .tokens,
				action: {
					viewModel.selectedTab = .tokens
				}
			)
		}
		.padding(.horizontal, UI.Spacing.level06)
	}

	private func createFilterButton(title: String, isSelected: Bool = false, action: @escaping () -> Void) -> some View {
		Button {
			action()
		} label: {
			Text(title)
				.font(.heading4)
				.foregroundStyle(isSelected ? .b0 : .textPrimary)
				.padding(.vertical, 5.5)
				.padding(.horizontal, 9.5)
				.background(
					RoundedRectangle(cornerRadius: UI.Corner.s)
						.fill(isSelected ? .textPrimary : Color.strokeSecondary)
				)
		}
	}

	private var nfts: some View {
		VStack {
			NFTGalleryView(nfts: viewModel.nfts)
			Spacer(minLength: UI.Spacing.level15)
		}
	}

	private var trendingTokens: some View {
		Section(header: sectionHeader(title: "trending_tokens_title".localized, subtitle: "see_more".localized)) {
			VStack(alignment: .leading, spacing: UI.Spacing.level04) {
				ForEach(displayedTokens, id: \.self) { token in
					TokenCardView(model: token)
				}
				Spacer(minLength: UI.Spacing.level15)
			}
			.padding(.horizontal, UI.Spacing.level06)
		}
	}

	private var displayedTokens: [TokenModel] {
		if showAll {
			return viewModel.tokens
		}
		return Array(viewModel.tokens.prefix(4))
	}

	private func sectionHeader(title: String, subtitle: String? = nil) -> some View {
		HStack(alignment: .firstTextBaseline) {
			Text(title)
				.font(.heading3Bold)
				.foregroundColor(Color.textPrimary)

			Spacer()

			if let subtitle {
				Text(subtitle)
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundColor(showAll ? Color.violetDefault : Color.graySecondary)
					.onTapGesture {
						showAll.toggle()
					}
			}
		}
		.padding(.horizontal, UI.Spacing.level06)
		.padding(.top, UI.Spacing.level07)
		.padding(.bottom, UI.Spacing.level04)
	}
}
