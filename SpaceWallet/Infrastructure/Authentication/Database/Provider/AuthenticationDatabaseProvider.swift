//
//  AuthenticationDatabaseProvider.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Combine
import SwiftData

class AuthenticationDatabaseProvider: IAuthenticationDatabaseProvider {

	private let tag = "authenticationSession"

	func getSession() -> AuthenticationKeychainEntity? {
		KeychainHelper.shared.read(tag: tag)
	}

	func setSession(authenticationKeychainEntity: AuthenticationKeychainEntity) {
		KeychainHelper.shared.save(authenticationKeychainEntity, tag: tag)
	}

	func deleteSession() {
		KeychainHelper.shared.delete(tag: tag)
	}
}
