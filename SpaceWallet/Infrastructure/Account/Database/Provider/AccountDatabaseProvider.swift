//
//  AccountDatabaseProvider.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import Factory
import Foundation
import SwiftData

class AccountDatabaseProvider: IAccountDatabaseProvider {

	@Injected(\.accountDao)
	private var accountDao

	func get(email: String, context: ModelContext) -> AnyPublisher<AccountSwiftDataEntity?, Error> {
		accountDao.get(email: email, context: context)
	}

	func insertOrUpdate(entity: AccountSwiftDataEntity, context: ModelContext) -> AnyPublisher<Void, Error> {
		accountDao.insertOrUpdate(entity, context: context)
	}

	func updateBalance(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) -> AnyPublisher<BalanceSwiftDataEntity?, Error> {
		accountDao.updateBalance(email: email, newBalance: newBalance, context: context)
	}

	func updateCurrency(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) -> AnyPublisher<CurrencySwiftDataEntity?, Error> {
		accountDao.updateCurrency(email: email, newCurrency: newCurrency, context: context)
	}

	func delete(email: String, context: ModelContext) -> AnyPublisher<Void, Error> {
		accountDao.delete(email: email, context: context)
	}

	func deleteAll(context: ModelContext) -> AnyPublisher<Void, Error> {
		accountDao.deleteAll(context: context)
	}
}
