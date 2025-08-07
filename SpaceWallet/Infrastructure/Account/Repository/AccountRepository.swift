//
//  AccountRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Combine
import Factory
import SwiftData
import SwiftUI

class AccountRepository: IAccountRepository {

	@Injected(\.accountDatabaseProvider)
	private var accountDatabaseProvider

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

	func updateBalanceUseCase(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) -> AnyPublisher<BalanceModel, Error> {
		accountDatabaseProvider.updateBalance(email: email, newBalance: newBalance, context: context)
			.tryMap { entity in
				guard let entity else {
					throw NSError(domain: "BalanceUpdateFailed", code: 404, userInfo: [NSLocalizedDescriptionKey: "Balance update failed."])
				}
				return entity.toModel()
			}
			.eraseToAnyPublisher()
	}

	func updateCurrency(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) -> AnyPublisher<CurrencyModel, Error> {
		accountDatabaseProvider.updateCurrency(email: email, newCurrency: newCurrency, context: context)
			.tryMap { entity in
				guard let entity else {
					throw NSError(domain: "CurrencyUpdateFailed", code: 404, userInfo: [NSLocalizedDescriptionKey: "Currency update failed."])
				}
				return entity.toModel()
			}
			.eraseToAnyPublisher()
	}
}
