//
//  HomeScreenBottomSheets.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 18/07/2025.
//

import SwiftUI

extension LandingPageScreen {

	var receiveBottomSheet: some View {
		CustomBottomSheet(
			height: 600,
			content: {
				contentView
			}
		)
		.mainTitle("receive".localized)
		.isShowing($isToShowReceiveBottomSheet)
	}

	private var contentView: some View {
		VStack(alignment: .leading) {
			EmptyView()
		}
	}
}
