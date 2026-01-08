//
//  AuthenticationRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Factory
import SwiftUI

@NetworkActor
class AuthenticationRepository: IAuthenticationRepository {

	@LazyInjected(\.authenticationDatabaseProvider)
	private var authenticationDatabaseProvider

	func checkFirstLaunchUseCase() async throws -> Bool {
        return UserDefaults.isFirstLaunch
	}

	func setSession(session: AuthenticationModel) async throws {
        try await authenticationDatabaseProvider.setSession(
            authenticationKeychainEntity: session.toEntity()
        )
	}
}
