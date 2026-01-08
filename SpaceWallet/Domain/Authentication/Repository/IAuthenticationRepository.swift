//
//  IAuthenticationRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftData

@NetworkActor
protocol IAuthenticationRepository {

	func checkFirstLaunchUseCase() async throws -> Bool
	func setSession(session: AuthenticationModel) async throws
}
