//
//  DiscoveryScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

struct DiscoveryScreen: View {

	@State private var selectedTab: Tab = .nfts

	private var viewModel: ViewModel = ViewModel()

	init() { }

	var body: some View {
		VStack(spacing: UI.Spacing.level07) {
			VStack(alignment: .leading, spacing: UI.Spacing.level04) {
				Search(placeholder: "discovery_search_bar_placeholder".localized)
					.style(.init(size: .m, state: .withStroke))
				filterButtons
			}
			content
		}
		.padding(.top, UI.Spacing.level07)
	}

	private var content: some View {
		ScrollView {
			switch screenState {
				case .nfts:
					NFTGalleryView(nfts: viewModel.nfts)
				case .tokens:
					EmptyView()
				case .sites:
					EmptyView()
				case .learn:
					EmptyView()
			}
		}
	}

	private var filterButtons: some View {
		HStack(alignment: .center, spacing: UI.Spacing.level04) {
			createFilterButton(
				title: "discovery_nfts".localized,
				isSelected: selectedTab == .nfts,
				action: {
					selectedTab = .nfts
				}
			)
			createFilterButton(
				title: "discovery_tokens".localized,
				isSelected: selectedTab == .tokens,
				action: {
					selectedTab = .tokens
				}
			)
			createFilterButton(
				title: "discovery_sites".localized,
				isSelected: selectedTab == .sites,
				action: {
					selectedTab = .sites
				}
			)
			createFilterButton(
				title: "discovery_learn".localized,
				isSelected: selectedTab == .learn,
				action: {
					selectedTab = .learn
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
}

extension DiscoveryScreen {

	enum Tab {
		case nfts
		case tokens
		case sites
		case learn
	}

	private enum ScreenState {
		case nfts
		case tokens
		case sites
		case learn
	}

	private var screenState: ScreenState {
		switch selectedTab {
			case .nfts:
				return .nfts
			case .tokens:
				return .tokens
			case .sites:
				return .sites
			case .learn:
				return .learn
		}
	}
}
