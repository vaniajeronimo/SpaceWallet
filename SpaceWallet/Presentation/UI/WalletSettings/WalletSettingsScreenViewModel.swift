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

		private var onAction: (ActionType) -> Void

		init(onAction: @escaping (ActionType) -> Void) {
			self.onAction = onAction
		}

		var cardsData: [WalletSettingsModel] {
			[
				WalletSettingsModel(
					id: 1,
					mainTitle: "savings".localized,
					image: .savings,
					title: "$32.14",
					subtitle: "emergency_fund".localized,
					action: {
						print("savings pressed")
						self.onAction(.savings)
					}
				),
				WalletSettingsModel(
					id: 2,
					mainTitle: "buy_bitcoin".localized,
					image: .buy_bitcoin,
					title: "$50.00",
					subtitle: "crypto_countdown".localized,
					action: { self.onAction(.buyBitcoin) }
				),
				WalletSettingsModel(
					id: 3,
					mainTitle: "research".localized,
					image: .research,
					title: "$12.25",
					subtitle: "market_research".localized,
					action: { self.onAction(.research) }
				),
				WalletSettingsModel(
					id: 4,
					mainTitle: "auto_invest".localized,
					image: .auto_invest,
					title: "$32.15",
					subtitle: "set_it_and_grow".localized,
					action: { self.onAction(.autoInvest) }
				)
			]
		}
	}
}
