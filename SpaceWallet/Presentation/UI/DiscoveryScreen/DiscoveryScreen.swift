//
//  DiscoveryScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

struct DiscoveryScreen: View {

	init() { }

	var body: some View {
		content
	}

	private var content: some View {
		VStack {
			Search(placeholder: "disovery_search_bar_placeholder".localized)
				.style(.init(size: .m, state: .withStroke))
			Spacer()
		}
		.padding(.top, UI.Spacing.level07)
	}
}
