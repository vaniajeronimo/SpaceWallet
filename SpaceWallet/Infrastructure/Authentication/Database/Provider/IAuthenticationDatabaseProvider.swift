//
//  IAuthenticationDatabaseProvider.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Foundation

@NetworkActor
protocol IAuthenticationDatabaseProvider {

	func getSession() async throws -> AuthenticationKeychainEntity?
	func setSession(authenticationKeychainEntity: AuthenticationKeychainEntity) async throws
	func deleteSession() async throws
}
