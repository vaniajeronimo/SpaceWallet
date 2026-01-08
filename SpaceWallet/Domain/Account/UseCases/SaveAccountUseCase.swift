//
//  SaveAccountUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Factory
import SwiftData

@MainActor
final class SaveAccountUseCase {

	@LazyInjected(\.accountRepository)
	private var repository

	func execute(account: AccountModel, context: ModelContext) async throws {
        try await repository.saveAccountUseCase(account: account.toEntity(), context: context)
	}
}
