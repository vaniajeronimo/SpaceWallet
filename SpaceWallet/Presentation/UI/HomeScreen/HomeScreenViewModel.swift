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
		var balanceValue: Double = 86.0
		var balanceColor: BalanceColor = .neutral

		var profitValue: String = String(format: "%.2f", 2.60)

		var formattedBalance: String {
			let value = String(format: "%.2f", balanceValue)
				.replacingOccurrences(of: "-", with: "")
				.replacingOccurrences(of: "+", with: "")
			return value
		}

		var userName: String {
			guard let email = UserDefaults.userEmail,
				  let name = email.split(separator: "@").first else {
				return ""
			}
			return String(name)
		}

		init(onAction: @escaping (ActionType) -> Void) {
			self.onAction = onAction
			setupActions()
			updateBalanceColor()
		}

		private func setupActions() {
			actions = [
				.init(icon: .receive, title: "receive".localized, action: { self.onAction(.receive) }),
				.init(icon: .send, title: "send".localized, action: { self.onAction(.send) }),
				.init(icon: .swap, title: "swap".localized, action: { self.onAction(.swap) }),
				.init(icon: .buy, title: "buy".localized, action: { self.onAction(.buy) })
			]
		}

		private func updateBalanceColor() {
			switch balanceValue {
				case ..<0:
					balanceColor = .negative
				case 0:
					balanceColor = .neutral
				default:
					balanceColor = .positive
			}
		}
	}
}
