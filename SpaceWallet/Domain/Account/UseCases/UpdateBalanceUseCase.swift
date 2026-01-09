//
//  UpdateBalanceUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import Factory
import SwiftData

@MainActor
final class UpdateBalanceUseCase {

	@LazyInjected(\.accountRepository)
	private var repository

    func updateBalance(email: String, newBalance: Double, context: ModelContext) async throws -> BalanceModel? {
		return try await repository.updateBalanceUseCase(email: email, newBalance: newBalance, context: context)
	}
}
