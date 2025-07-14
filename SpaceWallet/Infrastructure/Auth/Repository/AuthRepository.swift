//
//  AuthRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import Factory
import SwiftData
import SwiftUI

class AuthRepository: IAuthRepository {

	@Injected(\.accountDatabaseProvider)
	private var accountDatabaseProvider

	func checkFirstLaunchUseCase() -> AnyPublisher<Bool, Error> {
		return Future<Bool, Error> { promise in

			if UserDefaults.isFirstLaunch {
				return promise(.success(true))
			}
			return promise(.success(false))
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}

	func getAccountUseCase(email: String, context: ModelContext) -> AnyPublisher<AccountModel, Error> {
		accountDatabaseProvider.get(email: email, context: context)
			.tryMap { entity in
				guard let entity else {
					throw NSError(domain: "AccountNotFound", code: 404, userInfo: [NSLocalizedDescriptionKey: "Account not found."])
				}
				return entity.toModel()
			}
			.eraseToAnyPublisher()
	}

	func saveAccountUseCase(account: AccountEntity, context: ModelContext) -> AnyPublisher<Void, Error> {
		let swiftDataEntity = AccountSwiftDataEntity(account)
		return accountDatabaseProvider.insertOrUpdate(entity: swiftDataEntity, context: context)
	}
}
