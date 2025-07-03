//
//  CheckAuthStateUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import FirebaseAuth

public final class CheckAuthStateUseCase {
	private var authStateListener: AuthStateDidChangeListenerHandle?

	func execute() -> AnyPublisher<AuthDestinationModel, Error> {
		return Future<AuthDestinationModel, Error> { [weak self] promise in
			self?.authStateListener = Auth.auth().addStateDidChangeListener { _, user in
				if let listener = self?.authStateListener {
					Auth.auth().removeStateDidChangeListener(listener)
				}

				Task { @MainActor in
					if user != nil {
						promise(.success(.home))
					} else {
						promise(.success(.login))
					}
				}
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}
}
