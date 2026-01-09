//
//  CurrencySwiftDataEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import SwiftData

@Model
public class CurrencySwiftDataEntity {
	var rawValue: String

	var currency: CurrencyEntity {
		get { CurrencyEntity(rawValue: rawValue) ?? .eur }
		set { rawValue = newValue.rawValue }
	}

	init(currency: CurrencyEntity) {
		self.rawValue = currency.rawValue
	}

	public convenience init?(symbol: String) {
		guard let currencyType = CurrencyEntity(rawValue: symbol) else {
			return nil
		}
		self.init(currency: currencyType)
	}
}
