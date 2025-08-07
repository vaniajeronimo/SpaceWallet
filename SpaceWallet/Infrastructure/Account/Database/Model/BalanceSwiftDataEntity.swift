//
//  BalanceSwiftDataEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import SwiftData

@Model
public class BalanceSwiftDataEntity {
	var balance: Double
	var currency: CurrencySwiftDataEntity
	var margin: Double?
	var profit: Double?

	public init(
		balance: Double,
		currency: CurrencySwiftDataEntity,
		margin: Double? = nil,
		profit: Double? = nil
	) {
		self.balance = balance
		self.currency = currency
		self.margin = margin
		self.profit = profit
	}
}
