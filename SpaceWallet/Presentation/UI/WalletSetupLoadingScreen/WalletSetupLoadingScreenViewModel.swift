//
//  WalletSetupLoadingScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

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

		init(wallet: WalletModel, onAction: @escaping () -> Void) {
			self.wallet = wallet
			self.onAction = onAction
		}

        private func saveAccount() async {
            guard let context = modelContext,
                  let userEmail = UserDefaults.userEmail else {
                return
            }

            let account = AccountModel(
                id: .init(),
                email: userEmail,
                phoneNumber: UserDefaults.userPhoneNumber,
                wallet: wallet
            )

            do {
                let savedAccount = try await saveAccountUseCase.execute(account: account, context: context)
                print("Account model saved successfully. \(savedAccount)")
                onAction()
            } catch {
                Debug.error(error)
            }
        }

		func setContext(_ context: ModelContext) {
			self.modelContext = context

            Task { @MainActor in
                await saveAccount()
            }
		}
	}
}
