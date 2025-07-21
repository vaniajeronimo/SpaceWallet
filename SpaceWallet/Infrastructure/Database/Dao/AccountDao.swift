//
//  AccountDao.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import Foundation
import SwiftData

class AccountDao {

	// MARK: - GET Account
	func get(email: String, context: ModelContext) -> AnyPublisher<AccountSwiftDataEntity?, Error> {
		Deferred {
			Future { promise in
				do {
					let descriptor = FetchDescriptor<AccountSwiftDataEntity>(
						predicate: #Predicate { $0.email == email }
					)
					let results = try context.fetch(descriptor)
					promise(.success(results.first))
				} catch {
					promise(.failure(error))
				}
			}
		}
		.eraseToAnyPublisher()
	}

	// MARK: - INSERT or UPDATE
	func insertOrUpdate(_ entity: AccountSwiftDataEntity, context: ModelContext) -> AnyPublisher<Void, Error> {
		return Future { promise in
			do {
				context.insert(entity)
				try context.save()
				promise(.success(()))
			} catch {
				promise(.failure(error))
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}

	func updateBalance(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) -> AnyPublisher<BalanceSwiftDataEntity?, Error> {
		return Future { promise in
			do {
				let descriptor = FetchDescriptor<AccountSwiftDataEntity>(
					predicate: #Predicate { $0.email == email }
				)
				let results = try context.fetch(descriptor)

				if let account = results.first {
					if let existingBalance = account.balance {
						existingBalance.balance += newBalance.balance
					} else {
						account.balance = newBalance
					}
					try context.save()
					promise(.success(account.balance))
				} else {
					promise(.failure(NSError(domain: "UpdateFailure", code: 404)))
				}
			} catch {
				promise(.failure(error))
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}

	func updateCurrency(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) -> AnyPublisher<CurrencySwiftDataEntity?, Error> {
		return Future { promise in
			do {
				let descriptor = FetchDescriptor<AccountSwiftDataEntity>(
					predicate: #Predicate { $0.email == email }
				)
				let results = try context.fetch(descriptor)

				guard let account = results.first else {
					promise(.failure(NSError(domain: "UpdateFailure", code: 404, userInfo: [NSLocalizedDescriptionKey: "Account not found."])))
					return
				}

				let balance = account.balance ?? {
					let newBalance = BalanceSwiftDataEntity(.init(balance: 0.00, currency: .usd))
					account.balance = newBalance
					return newBalance
				}()

				balance.currency = newCurrency
				try context.save()

				promise(.success(balance.currency))
			} catch {
				promise(.failure(error))
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}

	// MARK: - DELETE by ID
	func delete(email: String, context: ModelContext) -> AnyPublisher<Void, Error> {
		return Future { promise in
			do {
				let descriptor = FetchDescriptor<AccountSwiftDataEntity>(
					predicate: #Predicate { $0.email == email }
				)
				let results = try context.fetch(descriptor)
				if let entity = results.first {
					context.delete(entity)
					try context.save()
				}
				promise(.success(()))
			} catch {
				promise(.failure(error))
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}

	// MARK: - DELETE All
	func deleteAll(context: ModelContext) -> AnyPublisher<Void, Error> {
		return Future { promise in
			do {
				let allAccounts = try context.fetch(FetchDescriptor<AccountSwiftDataEntity>())
				for account in allAccounts {
					context.delete(account)
				}
				try context.save()
				promise(.success(()))
			} catch {
				promise(.failure(error))
			}
		}
		.receive(on: DispatchQueue.main)
		.eraseToAnyPublisher()
	}
}
