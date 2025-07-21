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

		@ObservationIgnored
		@Binding var isShowing: Bool

		var amount: String = ""

		private var modelContext: ModelContext?
		private var cancellables = Set<AnyCancellable>()

		init(isShowing: Binding<Bool>) {
			self._isShowing = isShowing
		}

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
				} receiveValue: { [weak self] newBalance  in
					guard let self else { return }
					print(newBalance)
					isShowing = false
				}
				.store(in: &cancellables)
		}

		func setContext(_ context: ModelContext) {
			self.modelContext = context
		}
	}
}
