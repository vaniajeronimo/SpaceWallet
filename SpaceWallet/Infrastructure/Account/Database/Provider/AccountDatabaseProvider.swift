//
//  AccountDatabaseProvider.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Factory
import Foundation
import SwiftData

@MainActor
final class AccountDatabaseProvider: IAccountDatabaseProvider {

	@Injected(\.accountDao)
	private var accountDao

    func get(email: String, context: ModelContext) async throws -> AccountSwiftDataEntity? {
		try await accountDao.get(email: email, context: context)
	}

	func insertOrUpdate(entity: AccountSwiftDataEntity, context: ModelContext) async throws {
        try await accountDao.insertOrUpdate(entity, context: context)
	}

	func updateBalance(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) async throws -> BalanceSwiftDataEntity? {
        try await accountDao.updateBalance(email: email, newBalance: newBalance, context: context)
	}

	func updateCurrency(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) async throws -> CurrencySwiftDataEntity? {
        try await accountDao.updateCurrency(email: email, newCurrency: newCurrency, context: context)
	}

	func delete(email: String, context: ModelContext) async throws {
        try await accountDao.delete(email: email, context: context)
	}

	func deleteAll(context: ModelContext) async throws {
        try await accountDao.deleteAll(context: context)
	}
}
