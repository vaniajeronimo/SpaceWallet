//
//  AuthenticationKeychainSwiftDataEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Foundation
import SwiftData

@Model
class AuthenticationKeychainSwiftDataEntity {
	var id: UUID
	var email: String
	var password: String?

	init(
		id: UUID = UUID(),
		email: String = "",
		password: String? = nil,
	) {
		self.id = id
		self.email = email
		self.password = password
	}
}
