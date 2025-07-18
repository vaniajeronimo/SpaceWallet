//
//  HomeScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import SwiftUI

extension HomeScreen {
	@Observable
	@MainActor
	final class ViewModel {

		let onAction: (ActionType) -> Void
		var actions: [ActionCardModel] = []

		var currentBalance: BalanceModel {
			.init(
				balance: 0.00,
				currency: .usd,
				margin: 0.00,
				profit: 0.00
			)
		}

		var formattedBalance: String {
			let value = String(format: "%.2f", currentBalance.balance)
				.replacingOccurrences(of: "-", with: "")
				.replacingOccurrences(of: "+", with: "")
			return value
		}

		var balanceColor: BalanceColor {
			switch currentBalance.status {
				case .profit:
					return .positive
				case .loss:
					return .negative
				case .breakEven:
					return .neutral
			}
		}

		var userName: String {
			guard let email = UserDefaults.userEmail,
				  let name = email.split(separator: "@").first else {
				return ""
			}
			return String(name)
		}

		var nfts: [CollectibleModel] = [
			.init(name: "space_monkey", imageName: "space_monkey_nft", description: "space_monkey_nft_description".localized),
			.init(name: "orange_monkey", imageName: "orange_monkey_nft", description: "orange_monkey_nft_description".localized),
			.init(name: "banana_monkey", imageName: "banana_monkey_nft", description: "banana_monkey_nft_description".localized),
			.init(name: "light_sepctrum", imageName: "color_spectrum_nft", description: "light_spectrum_nft_description".localized),
			.init(name: "dark_spectrum", imageName: "color_spectrum2_nft", description: "dark_spectrum_nft_description".localized)
		]

		init(onAction: @escaping (ActionType) -> Void) {
			self.onAction = onAction
			setupActions()
		}

		private func setupActions() {
			actions = [
				.init(icon: .receive, title: "receive".localized, action: { self.onAction(.receive) }),
				.init(icon: .send, title: "send".localized, action: { self.onAction(.send) }),
				.init(icon: .swap, title: "swap".localized, action: { self.onAction(.swap) }),
				.init(icon: .buy, title: "buy".localized, action: { self.onAction(.buy) })
			]
		}
	}
}
