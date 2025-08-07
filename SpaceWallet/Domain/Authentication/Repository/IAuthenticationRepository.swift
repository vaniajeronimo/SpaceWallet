//
//  IAuthenticationRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import SwiftData

protocol IAuthenticationRepository {

	func checkFirstLaunchUseCase() -> AnyPublisher<Bool, Error>
	func setSession(session: AuthenticationModel) -> AnyPublisher<Void, Error>
}
