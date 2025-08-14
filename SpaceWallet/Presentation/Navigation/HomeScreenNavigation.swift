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
					navigation.push(send)
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
			SendScreen(onAction: { action in
				switch action {
					case .sendToken(let token):
						navigation.push(sendTo(with: token))
					default:
						break
				}
			})
		}
		.navigationTitle("send".localized)
		.navigationLeftButton(.init(.back(action: {
			navigation.popOrDismiss()
		})))
		.navigationPrimaryRightButton(.init(.custom(icon: .dots, hasBackground: true, action: {
			print("options action")
		})), isToShow: true)
	}

	private func sendTo(with token: TokenModel) -> some View {
		NavigationBar {
			SendToScreen { avatar in
				navigation.push(sendAmount(with: token, for: avatar))
			}
		}
		.navigationTitle("sendTo".localized(with: token.tokenSymbol))
		.navigationLeftButton(.init(.back(action: {
			navigation.popOrDismiss()
		})))
		.navigationPrimaryRightButton(.init(.custom(icon: .dots, hasBackground: true, action: {
			print("options action")
		})), isToShow: true)
	}

	private func sendAmount(with token: TokenModel, for avatar: AvatarModel) -> some View {
		NavigationBar {
			EmptyView()
		}
		.navigationTitle("enter_amount_title".localized)
		.navigationLeftButton(.init(.back(action: {
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
