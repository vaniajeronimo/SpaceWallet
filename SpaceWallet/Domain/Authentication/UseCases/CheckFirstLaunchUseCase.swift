//
//  CheckFirstLaunchUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import Factory

@NetworkActor
final class CheckFirstLaunchUseCase {

	@LazyInjected(\.authenticationRepository)
	private var repository

    func execute() async throws -> Bool {
        try await repository.checkFirstLaunchUseCase()
	}
}
