//
//  UpdateCurrencyUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import Factory
import SwiftData

@MainActor
final class UpdateCurrencyUseCase {

	@LazyInjected(\.accountRepository)
	private var repository

	func execute(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) async throws -> CurrencyModel? {
		return try await repository.updateCurrency(email: email, newCurrency: newCurrency, context: context)
	}
}
