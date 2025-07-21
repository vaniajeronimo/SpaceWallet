//
//  AccountModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftUI

struct AccountModel {
	var id: UUID
	var userName: String?
	var email: String
	var password: String?
	var phoneNumber: String?
	var accountName: String?
	var wallet: WalletModel?
	var balance: BalanceModel?

	init(
		id: UUID,
		userName: String? = nil,
		email: String,
		password: String? = nil,
		phoneNumber: String? = nil,
		accountName: String? = "Account1",
		wallet: WalletModel? = nil,
		balance: BalanceModel? = nil
	) {
		self.id = id
		self.userName = userName
		self.email = email
		self.password = password
		self.phoneNumber = phoneNumber
		self.accountName = accountName
		self.wallet = wallet
		self.balance = balance
	}
}
