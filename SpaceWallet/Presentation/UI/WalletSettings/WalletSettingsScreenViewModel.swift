//
//  WalletSettingsScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 24/07/2025.
//

import SwiftUI

extension WalletSettingsScreen {
	@Observable
	@MainActor
	final class ViewModel {

		let cardsData: [WalletSettingsModel] = [
			WalletSettingsModel(
				id: 1,
				mainTitle: "Savings",
				image: .savings,
				title: "$32.14",
				subtitle: "Emergency Fund"
			),
			WalletSettingsModel(
				id: 2,
				mainTitle: "Buy bitcoin",
				image: .buy_bitcoin,
				title: "$50.00",
				subtitle: "Crypto Countdown"
			),
			WalletSettingsModel(
				id: 3,
				mainTitle: "Research",
				image: .research,
				title: "$12.25",
				subtitle: "Market Research"
			),
			WalletSettingsModel(
				id: 4,
				mainTitle: "Auto Invest",
				image: .auto_invest,
				title: "$32.15",
				subtitle: "Set it and grow"
			)
		]
	}
}
