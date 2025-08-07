//
//  AuthenticationRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import Factory
import SwiftUI

class AuthenticationRepository: IAuthenticationRepository {

	@Injected(\.authenticationDatabaseProvider)
	private var authenticationDatabaseProvider

	func checkFirstLaunchUseCase() -> AnyPublisher<Bool, Error> {
		let isFirstLaunch = UserDefaults.isFirstLaunch
		return Just(isFirstLaunch)
			.setFailureType(to: Error.self)
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
	}

	func setSession(session: AuthenticationModel) -> AnyPublisher<Void, Error> {
		return Future<Void, Error> { promise in
			self.authenticationDatabaseProvider.setSession(authenticationKeychainEntity: session.toEntity())
			promise(.success(()))
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}
}
