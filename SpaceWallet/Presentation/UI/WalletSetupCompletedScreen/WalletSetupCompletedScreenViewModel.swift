//
//  WalletSetupCompletedScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import Factory
import SwiftData
import SwiftUI

extension WalletSetupCompletedScreen {
	@Observable
	@MainActor
	final class ViewModel {

		@ObservationIgnored
		@Injected(\.saveAccountUseCase)
		private var saveAccountUseCase

		private var modelContext: ModelContext?
		private var cancellables = Set<AnyCancellable>()

		init() { }

		func saveAccount() {
			guard let modelContext else { return }

			let account = AccountModel(
				id: .init(),
				userName: "Vânia Jerónimo",
				email: UserDefaults.userEmail,
				phoneNumber: UserDefaults.userPhoneNumber,
				wallet: .init(id: .init(), name: "My Wallet", color: "violet_hover")
			)
			saveAccountUseCase.execute(account: account, context: modelContext)
				.sink { completion in
					switch completion {
						case .finished:
							break
						case .failure(let error):
							Debug.error(error)
					}
				} receiveValue: { account in
					print("Account model saved successfully. \(account)")
				}
				.store(in: &cancellables)
		}

		func setContext(_ context: ModelContext) {
			self.modelContext = context
		}
	}
}
