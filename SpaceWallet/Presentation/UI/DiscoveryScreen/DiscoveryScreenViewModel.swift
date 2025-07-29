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
			.init(name: "purple_monkey", imageName: "purple_monkey_nft", description: "purple_monkey_nft_description".localized),
			.init(name: "dark_monkey", imageName: "dark_monkey_nft", description: "dark_monkey_nft_description".localized),
			.init(name: "gray_monkey", imageName: "gray_monkey_nft", description: "gray_monkey_nft_description".localized),
			.init(name: "dark_purple_monkey", imageName: "dark_purple_monkey_nft", description: "dark_purple_monkey_nft_description".localized),
			.init(name: "white_monkey", imageName: "white_monkey_nft", description: "white_monkey_nft_description".localized)
		]

		init() { }
	}
}
