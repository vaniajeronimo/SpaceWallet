//
//  IAuthenticationDatabaseProvider.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Combine
import Foundation

protocol IAuthenticationDatabaseProvider {

	func getSession() -> AuthenticationKeychainEntity?
	func setSession(authenticationKeychainEntity: AuthenticationKeychainEntity)
	func deleteSession()
}
