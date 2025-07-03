//
//  HomeScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

public struct HomeScreen: View {

	@Environment(\.scenePhase) private var scenePhase

	@State private var tabSelection: TabBarItem
	private var onAction: (ActionType) -> Void

	public init(
		tabSelection: TabBarItem = .init(icon: .tabHomeSelected, title: TabBarId.home.id),
		onAction: @escaping (ActionType) -> Void
	) {
		self.tabSelection = tabSelection
		self.onAction = onAction
	}

	public var body: some View {
		TabBar(selection: $tabSelection) {
			EmptyView()
				.tabBarItem(selectedIcon: .tabHomeSelected, unselectedIcon: .tabHomeDeselected, title: TabBarId.home.id)
			EmptyView()
				.tabBarItem(selectedIcon: .tabWalletSelected, unselectedIcon: .tabWalletDeselected, title: TabBarId.wallet.id)
			EmptyView()
				.tabBarItem(selectedIcon: .tabCreditCardSelected, unselectedIcon: .tabCreditCardDeselected, title: TabBarId.credit.id)
			EmptyView()
				.tabBarItem(selectedIcon: .tabSearchSelected, unselectedIcon: .tabSearchDeselected, title: TabBarId.search.id)
			EmptyView()
				.tabBarItem(selectedIcon: .tabStarsSelected, unselectedIcon: .tabStarsDeselected, title: TabBarId.stars.id)
		}
	}
}

public extension HomeScreen {

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

	enum ActionType {
		case receive
		case send
		case swap
		case buy
	}
}
