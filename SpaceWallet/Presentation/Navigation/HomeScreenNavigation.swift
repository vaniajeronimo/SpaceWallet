//
//  HomeScreenNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftData
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

	private var home: some View {
		HomeScreen { action in
			switch action {
				case .receive:
					onAction(.receive)
				case .send:
					break
				case .settings(let context):
					navigation.showFullScreen(settings(with: context))
				default:
					break
			}
		}
	}

	private func settings(with context: ModelContext) -> some View {
		SettingsScreen(context: context) { action in
			switch action {
				case .close:
					navigation.popOrDismiss()
			}
		}
	}
}

extension HomeScreenNavigation {

	enum ActionType {
		case receive
	}
}
