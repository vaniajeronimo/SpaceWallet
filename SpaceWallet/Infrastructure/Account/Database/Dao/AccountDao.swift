//
//  AccountDao.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Foundation
import SwiftData

@MainActor
final class AccountDao {

	// MARK: - GET Account
    func get(email: String, context: ModelContext) async throws -> AccountSwiftDataEntity? {
        let descriptor = FetchDescriptor<AccountSwiftDataEntity>(
            predicate: #Predicate { $0.email == email }
        )
        return try context.fetch(descriptor).first
    }

    // MARK: - INSERT OR UPDATE
    func insertOrUpdate(_ entity: AccountSwiftDataEntity, context: ModelContext) async throws {
        context.insert(entity)
        try context.save()
    }

    // MARK: - UPDATE BALANCE
    func updateBalance(
        email: String,
        newBalance: Double,
        context: ModelContext
    ) async throws -> BalanceSwiftDataEntity? {
        let account = try await get(email: email, context: context) ?? {
            let newAccount = AccountSwiftDataEntity(email: email)
            context.insert(newAccount)
            try context.save()
            return newAccount
        }()

        if let existingBalance = account.balance {
            existingBalance.balance += newBalance
        } else {
            let newBalance = BalanceSwiftDataEntity(
                balance: newBalance,
                currency: CurrencySwiftDataEntity(currency: .usd)
            )
            account.balance = newBalance
        }
        try context.save()
        return account.balance
    }

    // MARK: - UPDATE CURRENCY
    func updateCurrency(
        email: String,
        newCurrency: String,
        context: ModelContext
    ) async throws -> CurrencySwiftDataEntity? {
        let account = try await get(email: email, context: context) ?? {
            let newAccount = AccountSwiftDataEntity(email: email)
            context.insert(newAccount)
            try context.save()
            return newAccount
        }()

        let balance = account.balance ?? {
            let newBalance = BalanceSwiftDataEntity(.init(balance: 0.0, currency: .usd))
            account.balance = newBalance
            return newBalance
        }()

        balance.currency.rawValue = newCurrency
        try context.save()
        return balance.currency
    }

    // MARK: - DELETE BY EMAIL
    func delete(email: String, context: ModelContext) async throws {
        let descriptor = FetchDescriptor<AccountSwiftDataEntity>(
            predicate: #Predicate { $0.email == email }
        )
        if let entity = try context.fetch(descriptor).first {
            context.delete(entity)
            try context.save()
        }
    }

    // MARK: - DELETE ALL
    func deleteAll(context: ModelContext) async throws {
        let allAccounts = try context.fetch(FetchDescriptor<AccountSwiftDataEntity>())
        for account in allAccounts {
            context.delete(account)
        }
        try context.save()
    }
}
