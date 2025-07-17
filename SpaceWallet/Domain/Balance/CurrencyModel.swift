//
//  CurrencyModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public enum CurrencyModel: String {

	case eur = "€"
	case usd = "$"
	case gbp = "£"
	case jpy = "¥"

	public var symbol: String {
		return self.rawValue
	}
}
