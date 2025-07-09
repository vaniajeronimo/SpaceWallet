//
//  CheckIfEmailIsRegisteredUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import Combine
import Factory
import FirebaseAuth

final class CheckIfEmailIsRegisteredUseCase {

	@Injected(\.authRepository)
	private var repository

	func execute(email: String, password: String) -> AnyPublisher<AuthDestinationModel, Error> {
		return repository.checkIfEmailIsRegisteredUseCase(email: email, password: password)
	}
}
