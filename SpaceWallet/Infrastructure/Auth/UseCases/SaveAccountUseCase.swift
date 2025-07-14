//
//  SaveAccountUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import Factory
import SwiftData

final class SaveAccountUseCase {

	@Injected(\.authRepository)
	private var repository

	func execute(account: AccountModel, context: ModelContext) -> AnyPublisher<Void, Error> {
		return repository.saveAccountUseCase(account: account.toEntity(), context: context)
	}
}
