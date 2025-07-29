//
//  LandingPageScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

public struct LandingPageScreen: View {

	@StateObject private var languageManager = LanguageManager.shared
	@Environment(\.scenePhase) private var scenePhase

	@State private var tabSelection: TabBarItem
	@State var isToShowReceiveBottomSheet: Bool = false

	private var viewModel = ViewModel()

	public init(
		tabSelection: TabBarItem = .init(icon: .tabHomeSelected, title: TabBarId.home.id)
	) {
		self.tabSelection = tabSelection
	}

	public var body: some View {
		ZStack {
			TabBar(selection: $tabSelection) {
				HomeScreenNavigation(onAction: { action in
					if action == .receive {
						isToShowReceiveBottomSheet = true
					}
				})
				.tabBarItem(selectedIcon: .tabHomeSelected, unselectedIcon: .tabHomeDeselected, title: TabBarId.home.id)
				EmptyView()
					.tabBarItem(selectedIcon: .tabQrCodeSelected, unselectedIcon: .tabQrCodeDeselected, title: TabBarId.qrCode.id)
				WalletSettingsNavigation()
					.tabBarItem(selectedIcon: .tabWalletSettingsSelected, unselectedIcon: .tabWalletSettingsDeselected, title: TabBarId.wallet.id)
				ActivityNavigation()
					.tabBarItem(selectedIcon: .tabActivitySelected, unselectedIcon: .tabActivityDeselected, title: TabBarId.activity.id)
				DiscoveryNavigation()
					.tabBarItem(selectedIcon: .tabDiscoverySelected, unselectedIcon: .tabDiscoveryDeselected, title: TabBarId.discovery.id)
			}
			.onChange(of: scenePhase) { _, newPhase in
				if newPhase == .active {
					viewModel.observeNetworkStatus()
				}
			}
			.if(!viewModel.isConnected) { _ in
				ErrorScreen {
					viewModel.observeNetworkStatus()
				}
			}
			receiveBottomSheet
		}
		.environmentObject(languageManager)
		.id(languageManager.currentLanguage)
	}
}

public extension LandingPageScreen {

	enum TabBarId: String {
		case home
		case qrCode
		case wallet
		case activity
		case discovery

		public var id: String {
			switch self {
				case .home: return "home"
				case .qrCode: return "qrCode"
				case .wallet: return "wallet"
				case .activity: return "activity"
				case .discovery: return "discovery"
			}
		}
	}
}
