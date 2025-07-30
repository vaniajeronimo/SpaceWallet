//
//  DiscoveryScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

extension DiscoveryScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var nfts: [CollectibleModel] = [
			.init(id: 1, name: "purple_monkey", imageName: "purple_monkey_nft", description: "purple_monkey_nft_description".localized),
			.init(id: 2, name: "dark_purple_monkey", imageName: "dark_purple_monkey_nft", description: "dark_purple_monkey_nft_description".localized),
			.init(id: 3, name: "dark_monkey", imageName: "dark_monkey_nft", description: "dark_monkey_nft_description".localized),
			.init(id: 4, name: "gray_monkey", imageName: "gray_monkey_nft", description: "gray_monkey_nft_description".localized),
			.init(id: 5, name: "white_monkey", imageName: "white_monkey_nft", description: "white_monkey_nft_description".localized)
		]

		var tokens: [TokenModel] = [
			.init(id: 1, icon: "ic_eth_token", tokenName: "Ethereum", tokenSymbol: "ETH", amount: 0.000045, value: 240.00, profit: 1.77),
			.init(id: 2, icon: "ic_sol_token", tokenName: "Solana", tokenSymbol: "SOL", amount: 0.02, value: 80.00, profit: 0.4),
			.init(id: 3, icon: "ic_usdc_token", tokenName: "USDC", tokenSymbol: "USDC", amount: 147.12, value: 147.05, profit: 1.2)
		]

		init() { }
	}
}
