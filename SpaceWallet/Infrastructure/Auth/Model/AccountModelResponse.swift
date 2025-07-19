//
//  AccountModelResponse.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftUI

struct AccountModelResponse {
	var id: UUID
	var userName: String?
	var email: String
	var password: String?
	var phoneNumber: String?
	var accountName: String?
	var wallet: WalletModelResponse?
}
