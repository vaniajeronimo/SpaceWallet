//
//  TokenModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 30/07/2025.
//

import SwiftUI

public struct TokenModel: Identifiable, Hashable {
	public let id: Int
	let icon: String
	let tokenName: String
	let tokenSymbol: String
	let amount: Double?
	let value: Double?
	let profit: Double?

	init(
		id: Int,
		icon: String,
		tokenName: String,
		tokenSymbol: String,
		amount: Double? = nil,
		value: Double? = nil,
		profit: Double? = nil
	) {
		self.id = id
		self.icon = icon
		self.tokenName = tokenName
		self.tokenSymbol = tokenSymbol
		self.amount = amount
		self.value = value
		self.profit = profit
	}
}
