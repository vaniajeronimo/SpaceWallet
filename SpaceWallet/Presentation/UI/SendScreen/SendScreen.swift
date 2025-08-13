//
//  SendScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 13/08/2025.
//

import SwiftUI

struct SendScreen: View {

	@Bindable private var viewModel = ViewModel()
	@FocusState private var searchIsFocused: Bool

	@State private var selectedTab: TabButton.SelectedTab = .assets

	init() { }

	var body: some View {
		VStack(spacing: UI.Spacing.level07) {
			Search(
				placeholder: "search_bar_placeholder".localized,
				searchString: $viewModel.searchString
			)
			.style(.init(size: .m, state: .withStroke))
			.focused($searchIsFocused)

			tabButtons
			contentForSelectedTab

			Spacer()
		}
		.padding(.top, UI.Spacing.level07)
	}

	private var tabButtons: some View {
		TabButton(
			selectedTab: $selectedTab,
			onAction: { tab in
				selectedTab = tab
			}
		)
	}

	private var contentForSelectedTab: some View {
		switch selectedTab {
			case .assets:
				EmptyView()
			case .collectibles:
				EmptyView()
		}
	}
}

extension SendScreen {

	enum Tab {
		case assets
		case collectibles
	}

	private enum ScreenState {
		case assetsView
		case collectiblesView
	}

	private var screenState: ScreenState {
		switch selectedTab {
			case .assets:
				return .assetsView
			case .collectibles:
				return .collectiblesView
		}
	}
}
