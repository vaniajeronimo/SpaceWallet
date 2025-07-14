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
					return .wallet_blue_hover
				case 2:
					return .wallet_cyan_hover
				case 3:
					return .wallet_violet_hover
				case 4:
					return .wallet_green_hover
				case 5:
					return .wallet_pink_hover
				case 6:
					return .wallet_orange_hover
				case 7:
					return .wallet_yellow_hover
				case 8:
					return .wallet_green_stroke
				case 9:
					return .wallet_violet_stroke
				default:
					return .wallet_violet_hover
			}
		}

		init(wallet: WalletModel) {
			self.wallet = wallet
		}
	}
}
