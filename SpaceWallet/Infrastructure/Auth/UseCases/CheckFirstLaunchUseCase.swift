//
//  CheckFirstLaunchUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import Combine
import Factory
import FirebaseAuth

final class CheckFirstLaunchUseCase {

	@Injected(\.authRepository)
	private var repository

	func execute() -> AnyPublisher<AuthDestinationModel, Error> {
		return repository.checkFirstLaunchUseCase()
	}
}
