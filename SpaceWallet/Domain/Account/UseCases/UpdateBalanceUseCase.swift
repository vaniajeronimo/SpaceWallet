//
//  UpdateBalanceUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import Combine
import Factory
import SwiftData

final class UpdateBalanceUseCase {

	@Injected(\.accountRepository)
	private var repository

	func updateBalance(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) -> AnyPublisher<BalanceModel, Error> {
		return repository.updateBalanceUseCase(email: email, newBalance: newBalance, context: context)
	}
}
