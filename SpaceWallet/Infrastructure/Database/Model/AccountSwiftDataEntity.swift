//
//  AccountSwiftDataEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Foundation
import SwiftData

@Model
class AccountSwiftDataEntity {
	var id: UUID
	var userName: String?
	var email: String
	var password: String?
	var phoneNumber: String?
	var accountName: String?
	var wallet: WalletSwiftDataEntity?
	var balance: BalanceSwiftDataEntity?

	init(
		id: UUID = UUID(),
		userName: String? = nil,
		email: String = "",
		password: String? = nil,
		phoneNumber: String? = nil,
		accountName: String? = nil,
		wallet: WalletSwiftDataEntity? = nil,
		balance: BalanceSwiftDataEntity? = nil
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
