//
//  CurrencySwiftDataEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import SwiftData

public enum CurrencyType: String, Codable {
	case eur = "€"
	case usd = "$"
	case gbp = "£"
	case jpy = "¥"
}

@Model
public class CurrencySwiftDataEntity {
	var rawValue: String

	var currency: CurrencyType {
		get { CurrencyType(rawValue: rawValue) ?? .eur }
		set { rawValue = newValue.rawValue }
	}

	init(currency: CurrencyType) {
		self.rawValue = currency.rawValue
	}
}
