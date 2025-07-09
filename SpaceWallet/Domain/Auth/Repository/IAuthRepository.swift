//
//  IAuthRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine

protocol IAuthRepository {

	func checkAuthState() -> AnyPublisher<AuthDestinationModel, Error>
	func checkIfEmailIsRegisteredUseCase(email: String) -> AnyPublisher<Bool, Error>
}
