//
//  DiscoveryNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

struct DiscoveryNavigation: View, Navigation {

	internal var navigation = NavigationController()

	init() {
		navigation.rootView(discovery)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	private var discovery: some View {
		NavigationBar {
			DiscoveryScreen()
		}
		.navigationTitle("discovery_title".localized)
		.navigationPrimaryRightButton(.init(.custom(icon: .dots, hasBackground: true, action: {
			print("options action")
		})), isToShow: true)
	}
}
