//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public extension Image {

	static let planet = Image("planet", bundle: Bundle.main)
	static let star = Image("star", bundle: Bundle.main)
	static let noOrderFound = Image("no_order_found", bundle: Bundle.main)
	static let noSearchFound = Image("no_search_found", bundle: Bundle.main)
	static let emptyCart = Image("empty_cart", bundle: Bundle.main)

	// MARK: - TabBar Icons
	static let tabHomeSelected = Image("home_selected", bundle: Bundle.main)
	static let tabHomeDeselected = Image("home_deselected", bundle: Bundle.main)
	static let tabWalletSelected = Image("wallet_selected", bundle: Bundle.main)
	static let tabWalletDeselected = Image("wallet_deselected", bundle: Bundle.main)
	static let tabCreditCardSelected = Image("credit_card_selected", bundle: Bundle.main)
	static let tabCreditCardDeselected = Image("credit_card_deselected", bundle: Bundle.main)
	static let tabSearchSelected = Image("search_selected", bundle: Bundle.main)
	static let tabSearchDeselected = Image("search_deselected", bundle: Bundle.main)
	static let tabStarsSelected = Image("stars_selected", bundle: Bundle.main)
	static let tabStarsDeselected = Image("stars_deselected", bundle: Bundle.main)
}
