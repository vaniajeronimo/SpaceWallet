//
//  QRCodeBottomSheetViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import Combine
import Factory
import SwiftData
import SwiftUI

extension QRCodeBottomSheet {
	@MainActor
	@Observable
	final class ViewModel {

		@ObservationIgnored
		@Injected(\.updateBalanceUseCase)
		private var updateBalanceUseCase

		var amount: String = ""

		private var modelContext: ModelContext?
		private var cancellables = Set<AnyCancellable>()

		func updateBalance() {
			guard let modelContext,
				  let balance = amount.parsedAmount,
				  let email = UserDefaults.userEmail else {
				return
			}

			let newBalance = BalanceSwiftDataEntity(
				balance: balance,
				currency: .init(currency: .usd)
			)

			updateBalanceUseCase.updateBalance(email: email, newBalance: newBalance, context: modelContext)
				.receive(on: DispatchQueue.main)
				.sink { completion in
					switch completion {
						case .failure(let error):
							Debug.error(error)
						case .finished:
							break
					}
				} receiveValue: { newBalance  in
					print(newBalance)
				}
				.store(in: &cancellables)
		}

		func setContext(_ context: ModelContext) {
			self.modelContext = context
		}
	}
}
