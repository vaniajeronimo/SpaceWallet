//
//  SendScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 13/08/2025.
//

import Foundation

extension SendScreen {
	@Observable
	@MainActor
	final class ViewModel {

		@ObservationIgnored
		var searchString = "" {
			didSet { Task { await observeQuery(with: searchString) } }
		}

		var collectibles: [CollectibleModel] = []
		var assets: [TokenModel] = []
		var allCollectibles: [CollectibleModel] = []
		var allAssets: [TokenModel] = []

		var selectedTab: Tab = .assets

		init() {
			self.allCollectibles = [
				.init(id: 1, name: "meteor", imageName: "purple_monkey_nft", description: "purple_monkey_nft_description".localized),
				.init(id: 2, name: "purple", imageName: "dark_purple_monkey_nft", description: "dark_purple_monkey_nft_description".localized),
				.init(id: 3, name: "black", imageName: "dark_monkey_nft", description: "dark_monkey_nft_description".localized),
				.init(id: 4, name: "gray", imageName: "gray_monkey_nft", description: "gray_monkey_nft_description".localized),
				.init(id: 5, name: "white", imageName: "white_monkey_nft", description: "white_monkey_nft_description".localized)
			]
			self.collectibles = allCollectibles

			self.allAssets = [
				.init(id: 1, icon: "cardano", tokenName: "Cardano", tokenSymbol: "ADA", amount: 100.0, value: 60.50),
				.init(id: 2, icon: "cake", tokenName: "PancakeSwap", tokenSymbol: "CAKE", amount: 90.02, value: 30.00),
				.init(id: 3, icon: "kusama", tokenName: "Kusama", tokenSymbol: "KSM", amount: 147.12, value: 147.05),
				.init(id: 4, icon: "bitcoin", tokenName: "Bitcoin", tokenSymbol: "BTC", amount: 00.04, value: 90.05),
				.init(id: 5, icon: "matic", tokenName: "Polygon", tokenSymbol: "MATIC", amount: 6.04, value: 11.05),
				.init(id: 6, icon: "chainlink", tokenName: "Chainlink", tokenSymbol: "LINK", amount: 7.04, value: 12.05)
			]
			self.assets = allAssets
		}

		private func searchCollectibles(_ searchText: String) -> [CollectibleModel] {
			guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
				return allCollectibles
			}
			return allCollectibles.filter {
				$0.name.localizedCaseInsensitiveContains(searchText)
			}
		}

		private func searchAssets(_ searchText: String) -> [TokenModel] {
			guard searchText.trimmingCharacters(in: .whitespacesAndNewlines).isNotEmpty else {
				return allAssets
			}
			return allAssets.filter { asset in
				asset.tokenName.range(of: searchText, options: .caseInsensitive) != nil ||
				asset.tokenSymbol.range(of: searchText, options: .caseInsensitive) != nil
			}
		}

		func observeQuery(with searchText: String) async {
			try? await Task.sleep(nanoseconds: 100_000_000)
			if Task.isCancelled { return }

			if searchText.isEmpty {
				collectibles = allCollectibles
				assets = allAssets
			} else {
				collectibles = searchCollectibles(searchText)
				assets = searchAssets(searchText)

				if collectibles.isNotEmpty {
					selectedTab = .collectibles
				} else if assets.isNotEmpty {
					selectedTab = .assets
				}
			}
		}
	}
}

extension SendScreen.ViewModel {

	enum Tab {
		case assets
		case collectibles
	}

	private enum ScreenState {
		case assetsView
		case collectiblesView
	}

	private var screenState: ScreenState {
		switch selectedTab {
			case .assets:
				return .assetsView
			case .collectibles:
				return .collectiblesView
		}
	}
}
