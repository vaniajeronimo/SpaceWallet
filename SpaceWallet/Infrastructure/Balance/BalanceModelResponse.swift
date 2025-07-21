//
//  BalanceModelResponse.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import SwiftUI

public struct BalanceModelResponse: Decodable {

	public let balance: Double
	public let currency: CurrencyModelResponse
	public let margin: Double?
	public let profit: Double?

	public var status: BalanceStatusModel {
		if let profit {
			return BalanceStatusModel.from(value: profit)
		}
		if let margin {
			return BalanceStatusModel.from(value: margin)
		}
		return BalanceStatusModel.from(value: balance)
	}
}
