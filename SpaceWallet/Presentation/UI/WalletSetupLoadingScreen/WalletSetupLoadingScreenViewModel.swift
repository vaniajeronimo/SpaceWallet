//
//  WalletSetupLoadingScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import Factory
import SwiftData
import SwiftUI

extension WalletSetupLoadingScreen {
	@Observable
	@MainActor
	final class ViewModel {

		@ObservationIgnored
		@Injected(\.saveAccountUseCase)
		private var saveAccountUseCase

		private let wallet: WalletModel
		private let onAction: () -> Void
		private var modelContext: ModelContext?
		private var cancellables = Set<AnyCancellable>()

		init(wallet: WalletModel, onAction: @escaping () -> Void) {
			self.wallet = wallet
			self.onAction = onAction
		}

		func saveAccount() {
			guard let modelContext,
				  let userEmail = UserDefaults.userEmail
			else { return }

			let account = AccountModel(
				id: .init(),
				email: userEmail,
				password: UserDefaults.userPassword,
				phoneNumber: UserDefaults.userPhoneNumber,
				wallet: wallet
			)
			saveAccountUseCase.execute(account: account, context: modelContext)
				.sink { completion in
					switch completion {
						case .finished:
							break
						case .failure(let error):
							Debug.error(error)
					}
				} receiveValue: { [weak self] account in
					guard let self else { return }
					print("Account model saved successfully. \(account)")
					onAction()
				}
				.store(in: &cancellables)
		}

		func setContext(_ context: ModelContext) {
			self.modelContext = context

			executeInMainThread({
				self.saveAccount()
			}, after: 1.5)
		}
	}
}
