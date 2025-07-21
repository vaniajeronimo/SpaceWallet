//
//  CurrencyModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import SwiftUI

struct CurrencySelectableModel: Equatable {

	var currency: String
	var iconName: String
	var selectedCurrency: Currency?

	init(
		currency: String,
		iconName: String,
		selectedCurrency: Currency? = nil
	) {
		self.currency = currency
		self.iconName = iconName
		self.selectedCurrency = selectedCurrency
	}

	struct Currency: SelectableItemProtocol {

		var id: Int
		var name: String
		var description: String { name }
		var currency: String
		var iconName: String

		var item: Self { self }
	}
}
