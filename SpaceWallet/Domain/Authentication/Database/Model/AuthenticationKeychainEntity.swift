//
//  AuthenticationKeychainEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Foundation

struct AuthenticationKeychainEntity: Codable {
	var id: UUID
	var email: String
	var password: String
}
