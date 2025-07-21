//
//  WalletSetupCompletedScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftUI

extension WalletSetupCompletedScreen {
	@Observable
	@MainActor
	final class ViewModel {

		private let wallet: WalletModel

		var customizedWallet: Image {
			switch wallet.id {
				case 1:
					return .blue_wallet_hover
				case 2:
					return .cyan_wallet_hover
				case 3:
					return .violet_wallet_hover
				case 4:
					return .green_wallet_hover
				case 5:
					return .pink_wallet_hover
				case 6:
					return .orange_wallet_hover
				case 7:
					return .yellow_wallet_hover
				case 8:
					return .green_wallet_stroke
				case 9:
					return .violet_wallet_stroke
				default:
					return .violet_wallet_hover
			}
		}

		init(wallet: WalletModel) {
			self.wallet = wallet
		}
	}
}
