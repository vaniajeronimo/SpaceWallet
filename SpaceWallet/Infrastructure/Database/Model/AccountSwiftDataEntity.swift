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
	var wallet: WalletSwiftDataEntity?

	init(
		id: UUID = UUID(),
		userName: String? = nil,
		email: String = "",
		password: String? = nil,
		phoneNumber: String? = nil,
		wallet: WalletSwiftDataEntity? = nil
	) {
		self.id = id
		self.userName = userName
		self.email = email
		self.password = password
		self.phoneNumber = phoneNumber
		self.wallet = wallet
	}
}
