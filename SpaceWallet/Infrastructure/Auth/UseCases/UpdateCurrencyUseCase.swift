//
//  UpdateCurrencyUseCase.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import Combine
import Factory
import SwiftData

final class UpdateCurrencyUseCase {

	@Injected(\.authRepository)
	private var repository

	func execute(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) -> AnyPublisher<CurrencyModel, Error> {
		return repository.updateCurrency(email: email, newCurrency: newCurrency, context: context)
	}
}
