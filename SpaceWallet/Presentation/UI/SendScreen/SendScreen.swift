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

	@State private var showAlert: Bool = false
	@State private var selectedTab: TabButton.SelectedTab = .assets

	private let onAction: (ActionType) -> Void

	init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

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

	@ViewBuilder
	private var contentForSelectedTab: some View {
		ScrollView {
			switch selectedTab {
				case .assets:
					assetsList
				case .collectibles:
					EmptyView()
			}
		}
	}

	private var assetsList: some View {
		VStack(alignment: .leading, spacing: UI.Spacing.level04) {
			ForEach(viewModel.assets, id: \.self) { asset in
				TokenCardView(
					model: asset,
					onTap: {
						onAction(.sendToken(asset))
					}
				)
			}
		}
		.padding(.horizontal, UI.Spacing.level06)
	}
}

extension SendScreen {

	enum ActionType {
		case sendToken(TokenModel)
		case sendCollectible(CollectibleModel)
	}
}
