//
//  CheckFirstLaunchUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import Combine
import Factory

final class CheckFirstLaunchUseCase {

	@Injected(\.authenticationRepository)
	private var repository

	func execute() -> AnyPublisher<Bool, Error> {
		return repository.checkFirstLaunchUseCase()
	}
}
