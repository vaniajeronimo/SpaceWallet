//
//  getAccountUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Factory
import SwiftData

@MainActor
final class GetAccountUseCase {

	@LazyInjected(\.accountRepository)
	private var repository

	func execute(email: String, context: ModelContext) async throws -> AccountModel? {
        try await repository.getAccountUseCase(email: email, context: context)
	}
}
