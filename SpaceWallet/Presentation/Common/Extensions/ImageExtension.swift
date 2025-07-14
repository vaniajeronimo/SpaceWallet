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
	static let apple = Image("apple", bundle: Bundle.main)
	static let google = Image("google", bundle: Bundle.main)
	static let noOrderFound = Image("no_order_found", bundle: Bundle.main)
	static let noSearchFound = Image("no_search_found", bundle: Bundle.main)
	static let emptyCart = Image("empty_cart", bundle: Bundle.main)
	static let errorImg = Image("error_img", bundle: Bundle.main)
	static let close_icon = Image("close", bundle: Bundle.main)
	static let chevronLeft = Image("chevron_left", bundle: Bundle.main)
	static let checkmark = Image("check", bundle: Bundle.main)
	static let close_dark = Image("close_dark", bundle: Bundle.main)
	static let info = Image("info", bundle: Bundle.main)
	static let face_id = Image("face_id", bundle: Bundle.main)
	static let secure_shield = Image("secure_shield", bundle: Bundle.main)
	static let hourglass = Image("time_hourglass", bundle: Bundle.main)

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

	// MARK: - Onboarding
	static let onboarding_dialog = Image("dialog", bundle: Bundle.main)
	static let onboarding_locker = Image("locker", bundle: Bundle.main)
	static let onboarding_mobile = Image("mobile", bundle: Bundle.main)
	static let onboarding_arrow = Image("arrow", bundle: Bundle.main)

	// MARK: - Flags
	static let usa = Image("united_states", bundle: Bundle.main)
	static let spain = Image("spain", bundle: Bundle.main)
	static let portugal = Image("portugal", bundle: Bundle.main)
}
