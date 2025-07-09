//
//  AuthRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import Factory
import FirebaseAuth
import FirebaseFunctions

class AuthRepository: IAuthRepository {

	private lazy var functions = Functions.functions()

	func checkIfEmailIsRegisteredUseCase(email: String) -> AnyPublisher<Bool, Error> {
		return Future<Bool, Error> { [weak self] promise in
			let data: [String: Any] = ["email": email]

			self?.functions.httpsCallable("checkIfEmailExists").call(data) { result, error in
				if let error {
					promise(.failure(error))
					return
				}

				if let data = result?.data as? [String: Any],
				   let exists = data["exists"] as? Bool {
					promise(.success(exists))
				} else {
					promise(.success(false))
				}
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}

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
