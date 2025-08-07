//
//  SetSessionUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Combine
import Factory

final class SetSessionUseCase {

	@Injected(\.authenticationRepository)
	private var repository

	func execute(session: AuthenticationModel) -> AnyPublisher<Void, Error> {
		return repository.setSession(session: session)
	}
}
