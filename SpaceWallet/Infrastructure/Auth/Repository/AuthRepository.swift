//
//  AuthRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import Factory
import FirebaseAuth

class AuthRepository: IAuthRepository {

	func checkAuthState() -> AnyPublisher<AuthDestinationModel, Error> {
		return Future<AuthDestinationModel, Error> { promise in
			var handle: AuthStateDidChangeListenerHandle?

			handle = Auth.auth().addStateDidChangeListener { _, user in
				if let listener = handle {
					Auth.auth().removeStateDidChangeListener(listener)
				}
				let destination: AuthDestinationModel = (user != nil) ? .home : .login
				promise(.success(destination))
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}
}
