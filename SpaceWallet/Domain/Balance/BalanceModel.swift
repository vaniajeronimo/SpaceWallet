//
//  BalanceModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public struct BalanceModel {

	public var balance: Double
	public var currency: CurrencyModel
	public var margin: Double?
	public var profit: Double?

	public var status: BalanceStatusModel {
		if let profit {
			return BalanceStatusModel.from(value: profit)
		}
		if let margin {
			return BalanceStatusModel.from(value: margin)
		}
		return BalanceStatusModel.from(value: balance)
	}

	public init(
		balance: Double,
		currency: CurrencyModel,
		margin: Double? = nil,
		profit: Double? = nil
	) {
		self.balance = balance
		self.currency = currency
		self.margin = margin
		self.profit = profit
	}
}
