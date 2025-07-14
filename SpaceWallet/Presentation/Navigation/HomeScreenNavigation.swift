//
//  HomeScreenNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftUI

struct HomeScreenNavigation: View, Navigation {

	internal var navigation = NavigationController()

	init() {
		navigation.rootView(home)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	private var home: some View {
		HomeScreen { action in
			switch action {
				case .buy:
					break
				default:
					break
			}
		}
	}
}
