//
//  IAuthRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine

protocol IAuthRepository {

	func checkIfEmailIsRegisteredUseCase(email: String, password: String) -> AnyPublisher<AuthDestinationModel, Error>
}
