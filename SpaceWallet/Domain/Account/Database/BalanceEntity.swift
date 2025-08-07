//
//  BalanceEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import Foundation

public struct BalanceEntity: Codable {
	var balance: Double
	var currency: CurrencyEntity
	var margin: Double?
	var profit: Double?
}
