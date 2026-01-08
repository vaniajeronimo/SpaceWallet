//
//  QRCodeBottomSheetViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

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

		init(isShowing: Binding<Bool>) {
			self._isShowing = isShowing
		}

        func updateBalance() async {
            guard let context = modelContext,
                  let balance = amount.parsedAmount,
                  let email = UserDefaults.userEmail else {
                return
            }

            let newBalance = BalanceSwiftDataEntity(
                balance: balance,
                currency: .init(currency: .usd)
            )

            do {
                let updatedBalance = try await updateBalanceUseCase.updateBalance(
                    email: email,
                    newBalance: newBalance,
                    context: context
                )
                print(updatedBalance ?? "No balance returned")
                isShowing = false
            } catch {
                Debug.error(error)
            }
        }

		func setContext(_ context: ModelContext) {
			self.modelContext = context
		}
	}
}
