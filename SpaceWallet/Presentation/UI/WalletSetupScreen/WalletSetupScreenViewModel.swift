//
//  WalletSetupScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 11/07/2025.
//

import SwiftUI

extension WalletSetupScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var colorList: [WalletModel] = [
			.init(id: 1, name: "blue", color: "blue_hover"),
			.init(id: 2, name: "cyan", color: "cyan_hover"),
			.init(id: 3, name: "violet", color: "violet_hover"),
			.init(id: 4, name: "green", color: "green_hover"),
			.init(id: 5, name: "pink", color: "pink_hover"),
			.init(id: 6, name: "orange", color: "orange_hover"),
			.init(id: 7, name: "yellow", color: "yellow_hover"),
			.init(id: 8, name: "green_stroke", color: "green_stroke"),
			.init(id: 9, name: "purple_stroke", color: "violet_stroke")
		]

		var selectedColor: WalletModel?
	}
}
