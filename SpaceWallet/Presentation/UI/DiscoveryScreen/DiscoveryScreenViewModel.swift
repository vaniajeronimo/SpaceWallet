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
			.init(name: "purple_monkey", imageName: "purple_monkey_nft", description: "space_monkey_nft_description".localized),
			.init(name: "dark_monkey_nft", imageName: "dark_monkey_nft", description: "orange_monkey_nft_description".localized),
			.init(name: "gray_monkey", imageName: "gray_monkey_nft", description: "banana_monkey_nft_description".localized),
			.init(name: "dark_purple_monkey_nft", imageName: "dark_purple_monkey_nft", description: "militar_monkey_nft".localized),
			.init(name: "white_monkey_nft", imageName: "white_monkey_nft", description: "dark_spectrum_nft_description".localized)
		]

		init() { }
	}
}
