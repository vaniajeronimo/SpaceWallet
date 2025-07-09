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

	func checkIfEmailIsRegisteredUseCase(email: String, password: String) -> AnyPublisher<AuthDestinationModel, Error> {
		return Future<AuthDestinationModel, Error> { promise in

			Auth.auth().signIn(withEmail: email, password: password) { _, error in
				if let error = error as NSError? {
					if AuthErrorCode(rawValue: error.code) == .userNotFound {
						return promise(.success(.onboarding))
					}
				}
				return promise(.success(.verificationCode))
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}
}
