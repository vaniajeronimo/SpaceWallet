//
//  AccountEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftUI

struct AccountEntity: Codable {
	var id: UUID
	var userName: String?
	var email: String?
	var password: String?
	var phoneNumber: String?
	var wallet: WalletEntity?
}
