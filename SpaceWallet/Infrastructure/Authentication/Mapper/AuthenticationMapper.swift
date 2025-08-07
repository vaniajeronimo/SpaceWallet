//
//  AuthenticationMapper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Foundation

extension AuthenticationModel {

	init(_ model: AuthenticationModelResponse) {
		self.email = model.email
		self.password = model.password
	}

	init(_ model: AuthenticationKeychainEntity) {
		self.email = model.email
		self.password = model.password
	}

	func toEntity() -> AuthenticationKeychainEntity {
		return AuthenticationKeychainEntity(
			id: UUID(),
			email: email,
			password: password
		)
	}
}
