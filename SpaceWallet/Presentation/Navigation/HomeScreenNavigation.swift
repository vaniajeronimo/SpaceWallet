//
//  HomeScreenNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Foundation
import SwiftUI

struct HomeScreenNavigation: View, Navigation {

	private let onAction: (ActionType) -> Void
	internal var navigation = NavigationController()

	init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
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
					onAction(.receive)
				case .send:
					break
				default:
					break
			}
		}
	}
}

extension HomeScreenNavigation {

	enum ActionType {
		case receive
	}
}
