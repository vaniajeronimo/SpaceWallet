//
//  AuthRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import Foundation

class AuthRepository: IAuthRepository {

	func checkFirstLaunchUseCase() -> AnyPublisher<AuthDestinationModel, Error> {
		return Future<AuthDestinationModel, Error> { promise in

			if UserDefaults.isFirstLaunch {
				return promise(.success(.onboarding))
			}
			return promise(.success(.verificationCode))
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}
}
