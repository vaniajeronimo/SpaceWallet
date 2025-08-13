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

		@ObservationIgnored
		var searchString = "" {
			didSet { Task { await observeQuery(with: searchString) } }
		}

		var nfts: [CollectibleModel] = []
		var tokens: [TokenModel] = []
		var allNfts: [CollectibleModel] = []
		var allTokens: [TokenModel] = []

		var selectedTab: Tab = .nfts

		init() {
			self.allNfts = [
				.init(id: 1, name: "meteor", imageName: "purple_monkey_nft", description: "purple_monkey_nft_description".localized),
				.init(id: 2, name: "purple", imageName: "dark_purple_monkey_nft", description: "dark_purple_monkey_nft_description".localized),
				.init(id: 3, name: "black", imageName: "dark_monkey_nft", description: "dark_monkey_nft_description".localized),
				.init(id: 4, name: "gray", imageName: "gray_monkey_nft", description: "gray_monkey_nft_description".localized),
				.init(id: 5, name: "white", imageName: "white_monkey_nft", description: "white_monkey_nft_description".localized)
			]
			self.nfts = allNfts

			self.allTokens = [
				.init(id: 1, icon: "ic_eth_token", tokenName: "Ethereum", tokenSymbol: "ETH", amount: 0.000045, value: 240.00, profit: 1.77),
				.init(id: 2, icon: "ic_sol_token", tokenName: "Solana", tokenSymbol: "SOL", amount: 0.02, value: 80.00, profit: 0.4),
				.init(id: 3, icon: "ic_usdc_token", tokenName: "USDC", tokenSymbol: "USDC", amount: 147.12, value: 147.05, profit: 1.2),
				.init(id: 4, icon: "ic_shiba_token", tokenName: "Shiba Inu", tokenSymbol: "SHIB", amount: 100.04, value: 90.05, profit: 2.5),
				.init(id: 5, icon: "ic_sushi_token", tokenName: "Sushi Swap", tokenSymbol: "SUSHI", amount: 6.04, value: 11.05, profit: 0.7),
				.init(id: 6, icon: "ic_avax_token", tokenName: "Avalanche", tokenSymbol: "AVAX", amount: 7.04, value: 12.05, profit: 0.5)
			]
			self.tokens = allTokens
		}

		private func searchNfts(_ searchText: String) -> [CollectibleModel] {
			guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
				return allNfts
			}
			return allNfts.filter {
				$0.name.localizedCaseInsensitiveContains(searchText)
			}
		}

		private func searchTokens(_ searchText: String) -> [TokenModel] {
			guard searchText.trimmingCharacters(in: .whitespacesAndNewlines).isNotEmpty else {
				return allTokens
			}
			return allTokens.filter { token in
				token.tokenName.range(of: searchText, options: .caseInsensitive) != nil ||
				token.tokenSymbol.range(of: searchText, options: .caseInsensitive) != nil
			}
		}

		func observeQuery(with searchText: String) async {
			try? await Task.sleep(nanoseconds: 100_000_000)
			if Task.isCancelled { return }

			if searchText.isEmpty {
				nfts = allNfts
				tokens = allTokens
			} else {
				nfts = searchNfts(searchText)
				tokens = searchTokens(searchText)

				if nfts.isNotEmpty {
					selectedTab = .nfts
				} else if tokens.isNotEmpty {
					selectedTab = .tokens
				}
			}
		}
	}
}

extension DiscoveryScreen.ViewModel {

	enum Tab {
		case nfts
		case tokens
	}

	enum ScreenState {
		case nfts
		case tokens
	}

	var screenState: ScreenState {
		switch selectedTab {
			case .nfts:
				return .nfts
			case .tokens:
				return .tokens
		}
	}
}
