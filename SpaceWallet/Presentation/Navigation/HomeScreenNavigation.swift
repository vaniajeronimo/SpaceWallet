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
					navigation.showFullScreen(send)
				case .settings(let context):
					navigation.showFullScreen(settings(with: context))
				default:
					break
			}
		}
	}

	private func settings(with context: ModelContext) -> some View {
		SettingsScreen(
			context: context,
			onClose: {
				navigation.popOrDismiss()
			}
		)
	}

	private var send: some View {
		NavigationBar {
			SendScreen()
		}
		.navigationTitle("send".localized)
		.navigationLeftButton(.init(.close(action: {
			navigation.popOrDismiss()
		})))
		.navigationPrimaryRightButton(.init(.custom(icon: .dots, hasBackground: true, action: {
			print("options action")
		})), isToShow: true)
	}
}

extension HomeScreenNavigation {

	enum ActionType {
		case receive
	}
}
