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
		tabSelection: TabBarItem = .init(icon: .tabHomeSelected, title: "Home"),
		onAction: @escaping (ActionType) -> Void
	) {
		self.tabSelection = tabSelection
		self.onAction = onAction
	}

	public var body: some View {
		TabBar(selection: $tabSelection) {
			EmptyView()
				.tabBarItem(selectedIcon: .tabHomeSelected, unselectedIcon: .tabHomeDeselected, title: "Home")
			EmptyView()
				.tabBarItem(selectedIcon: .tabWalletSelected, unselectedIcon: .tabWalletDeselected, title: "Wallet")
			EmptyView()
				.tabBarItem(selectedIcon: .tabCreditCardSelected, unselectedIcon: .tabCreditCardDeselected, title: "Credit")
			EmptyView()
				.tabBarItem(selectedIcon: .tabSearchSelected, unselectedIcon: .tabSearchDeselected, title: "Search")
			EmptyView()
				.tabBarItem(selectedIcon: .tabStarsSelected, unselectedIcon: .tabStarsDeselected, title: "Stars")
		}
	}
}

public extension HomeScreen {

	enum ActionType {
		case receive
		case send
		case swap
		case buy
	}
}
