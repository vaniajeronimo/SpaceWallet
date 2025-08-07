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
}
