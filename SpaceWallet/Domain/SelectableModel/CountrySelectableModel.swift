//
//  CountrySelectableModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

struct CountrySelectableModel: Equatable {

	var countryName: String?
	var prefix: String?
	var iconName: String?
	var selectedCountry: Country?

	init(
		countryName: String? = nil,
		prefix: String? = nil,
		iconName: String? = nil,
		selectedCountry: Country? = nil
	) {
		self.countryName = countryName
		self.prefix = prefix
		self.iconName = iconName
		self.selectedCountry = selectedCountry
	}

	struct Country: SelectableItemProtocol {

		var id: Int
		var name: String
		var description: String { displayName }
		var prefix: String
		var iconName: String

		var item: Self { self }

		var displayName: String {
			"\(name) (\(prefix))"
		}
	}
}
