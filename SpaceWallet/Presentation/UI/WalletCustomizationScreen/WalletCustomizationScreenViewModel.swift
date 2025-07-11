//
//  WalletCustomizationScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 11/07/2025.
//

import SwiftUI

extension WalletCustomizationScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var colorList: [WalletColorModel] = [
			.init(id: "1", name: "blue", color: Color.blueHover),
			.init(id: "2", name: "cyan", color: Color.cyanHover),
			.init(id: "3", name: "violet", color: Color.violetHover),
			.init(id: "4", name: "green", color: Color.greenHover),
			.init(id: "5", name: "pink", color: Color.pinkHover),
			.init(id: "6", name: "orange", color: Color.orangeHover),
			.init(id: "7", name: "yellow", color: Color.yellowHover),
			.init(id: "8", name: "green_stroke", color: Color.greenStroke),
			.init(id: "9", name: "purple_stroke", color: Color.violetStroke)
		]

		var selectedColor: WalletColorModel?
	}
}
