//
//  IAccountRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import SwiftData

@MainActor
protocol IAccountRepository {

	func getAccountUseCase(email: String, context: ModelContext) async throws -> AccountModel?
	func saveAccountUseCase(account: AccountEntity, context: ModelContext) async throws
	func updateBalanceUseCase(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) async throws -> BalanceModel?
	func updateCurrency(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) async throws -> CurrencyModel?
}
