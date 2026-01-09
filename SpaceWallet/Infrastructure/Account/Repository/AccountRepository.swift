//
//  AccountRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Factory
import SwiftData
import SwiftUI

@MainActor
final class AccountRepository: IAccountRepository {

	@LazyInjected(\.accountDatabaseProvider)
	private var accountDatabaseProvider

    func getAccountUseCase(email: String, context: ModelContext) async throws -> AccountModel? {
        do {
            guard let entity = try await accountDatabaseProvider.get(email: email, context: context) else { return nil }
            return entity.toModel()
        } catch {
            throw NSError(domain: "GetAccountFailed", code: 404, userInfo: [NSLocalizedDescriptionKey: "Get account failed."])
        }
	}

    func saveAccountUseCase(account: AccountEntity, context: ModelContext) async throws {
        let swiftDataEntity = AccountSwiftDataEntity(account)

        try await accountDatabaseProvider.insertOrUpdate(
            entity: swiftDataEntity,
            context: context
        )
    }

	func updateBalanceUseCase(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) async throws -> BalanceModel? {
        do {
            guard let entity = try await accountDatabaseProvider.updateBalance(email: email, newBalance: newBalance, context: context) else { return nil }
            return entity.toModel()
        } catch {
            throw NSError(domain: "BalanceUpdateFailed", code: 404, userInfo: [NSLocalizedDescriptionKey: "Balance update failed."])
        }
	}

    func updateCurrency(email: String, newCurrency: String, context: ModelContext) async throws -> CurrencyModel? {
        do {
            guard let entity = try await accountDatabaseProvider.updateCurrency(email: email, newCurrency: newCurrency, context: context) else { return nil }
            return entity.toModel()
        } catch {
            throw NSError(domain: "CurrencyUpdateFailed", code: 404, userInfo: [NSLocalizedDescriptionKey: "Currency update failed."])
        }
	}
}
