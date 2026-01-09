//
//  IAccountDatabaseProvider.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftData

@MainActor
protocol IAccountDatabaseProvider {

	func get(email: String, context: ModelContext) async throws -> AccountSwiftDataEntity?
	func insertOrUpdate(entity: AccountSwiftDataEntity, context: ModelContext) async throws
	func updateBalance(email: String, newBalance: Double, context: ModelContext) async throws -> BalanceSwiftDataEntity?
	func updateCurrency(email: String, newCurrency: String, context: ModelContext) async throws -> CurrencySwiftDataEntity?
	func delete(email: String, context: ModelContext) async throws
	func deleteAll(context: ModelContext) async throws
}
