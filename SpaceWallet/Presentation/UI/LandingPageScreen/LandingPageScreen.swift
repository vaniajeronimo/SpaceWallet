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
					.tabBarItem(selectedIcon: .tabWalletSelected, unselectedIcon: .tabWalletDeselected, title: TabBarId.wallet.id)
				EmptyView()
					.tabBarItem(selectedIcon: .tabCreditCardSelected, unselectedIcon: .tabCreditCardDeselected, title: TabBarId.credit.id)
				ActivityNavigation()
					.tabBarItem(selectedIcon: .tabSearchSelected, unselectedIcon: .tabSearchDeselected, title: TabBarId.search.id)
				EmptyView()
					.tabBarItem(selectedIcon: .tabStarsSelected, unselectedIcon: .tabStarsDeselected, title: TabBarId.stars.id)
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
		case wallet
		case credit
		case search
		case stars

		public var id: String {
			switch self {
				case .home: return "Home"
				case .wallet: return "Wallet"
				case .credit: return "Credit"
				case .search: return "Search"
				case .stars: return "Stars"
			}
		}
	}
}
