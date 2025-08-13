//
//  TabButton.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 13/08/2025.
//

import SwiftUI

struct TabButton: View {

	@Binding private var selectedTab: SelectedTab
	private var onAction: (SelectedTab) -> Void

	init(selectedTab: Binding<SelectedTab>, onAction: @escaping (SelectedTab) -> Void) {
		self._selectedTab = selectedTab
		self.onAction = onAction
	}

	var body: some View {
		HStack(spacing: UI.Spacing.level07) {
			Button {
				onAction(.assets)
			} label: {
				Text("assets".localized)
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundStyle(selectedTab == .assets ? .textPrimary : .textTertiary)
			}

			Button {
				onAction(.collectibles)
			} label: {
				Text("collectibles".localized)
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundStyle(selectedTab == .collectibles ? .textPrimary : .textTertiary)
			}
		}
		.padding(.horizontal, UI.Spacing.level06)
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}

extension TabButton {

	enum SelectedTab {
		case assets
		case collectibles
	}
}
