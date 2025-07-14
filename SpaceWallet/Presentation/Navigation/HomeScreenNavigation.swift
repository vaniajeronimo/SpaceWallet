//
//  HomeScreenNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Foundation
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

	@ViewBuilder
	private var home: some View {
		HomeScreen { action in
			switch action {
				case .receive:
					break
				case .send:
					break
				default:
					break
			}
		}
	}
}
