//
//  IAccountDatabaseProvider.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import SwiftData

protocol IAccountDatabaseProvider {

	func get(email: String, context: ModelContext) -> AnyPublisher<AccountSwiftDataEntity?, Error>
	func insertOrUpdate(entity: AccountSwiftDataEntity, context: ModelContext) -> AnyPublisher<Void, Error>
	func updateBalance(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) -> AnyPublisher<BalanceSwiftDataEntity?, Error>
	func updateCurrency(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) -> AnyPublisher<CurrencySwiftDataEntity?, Error>
	func delete(email: String, context: ModelContext) -> AnyPublisher<Void, Error>
	func deleteAll(context: ModelContext) -> AnyPublisher<Void, Error>
}
