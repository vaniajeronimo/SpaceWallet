//
//  CurrencyModelResponse.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import SwiftUI

public enum CurrencyModelResponse: String, Decodable {
	case eur = "€"
	case usd = "$"
	case gbp = "£"
	case jpy = "¥"
}
