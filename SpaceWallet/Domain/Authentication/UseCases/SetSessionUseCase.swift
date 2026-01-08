//
//  SetSessionUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Factory

@NetworkActor
final class SetSessionUseCase {

	@LazyInjected(\.authenticationRepository)
	private var repository

	func execute(session: AuthenticationModel) async throws {
        try await repository.setSession(session: session)
	}
}
