//
//  getAccountUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import Factory
import SwiftData

final class GetAccountUseCase {

	@Injected(\.authRepository)
	private var repository

	func execute(email: String, context: ModelContext) -> AnyPublisher<AccountModel, Error> {
		return repository.getAccountUseCase(email: email, context: context)
	}
}
