//
//  IAuthRepository.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import SwiftData

protocol IAuthRepository {

	func checkFirstLaunchUseCase() -> AnyPublisher<Bool, Error>
	func getAccountUseCase(email: String, context: ModelContext) -> AnyPublisher<AccountModel, Error>
	func saveAccountUseCase(account: AccountEntity, context: ModelContext) -> AnyPublisher<Void, Error>
	func updateBalanceUseCase(email: String, newBalance: BalanceSwiftDataEntity, context: ModelContext) -> AnyPublisher<BalanceModel, Error>
	func updateCurrency(email: String, newCurrency: CurrencySwiftDataEntity, context: ModelContext) -> AnyPublisher<CurrencyModel, Error>
}
