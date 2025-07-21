//
//  HomeScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Combine
import Factory
import SwiftData
import SwiftUI

extension HomeScreen {
	@Observable
	@MainActor
	final class ViewModel {

		@ObservationIgnored
		@Injected(\.getAccountUseCase)
		private var getAccountUseCase

		let onAction: (ActionType) -> Void
		var actions: [ActionCardModel] = []

		private var modelContext: ModelContext?
		private var cancellables = Set<AnyCancellable>()

		var currentBalance = BalanceModel()
		var accountModel: AccountModel?

		var formattedBalance: String {
			let value = String(format: "%.2f", currentBalance.balance)
				.replacingOccurrences(of: "-", with: "")
				.replacingOccurrences(of: "+", with: "")
			return value
		}

		var balanceColor: BalanceColor {
			switch currentBalance.status {
				case .profit:
					return .positive
				case .loss:
					return .negative
				case .breakEven:
					return .neutral
			}
		}

		var userName: String {
			guard let email = UserDefaults.userEmail,
				  let name = email.split(separator: "@").first else {
				return ""
			}
			UserDefaults.userName = String(name)
			return String(name)
		}

		var nfts: [CollectibleModel] = [
			.init(name: "space_monkey", imageName: "space_monkey_nft", description: "space_monkey_nft_description".localized),
			.init(name: "orange_monkey", imageName: "orange_monkey_nft", description: "orange_monkey_nft_description".localized),
			.init(name: "banana_monkey", imageName: "banana_monkey_nft", description: "banana_monkey_nft_description".localized),
			.init(name: "light_sepctrum", imageName: "color_spectrum_nft", description: "light_spectrum_nft_description".localized),
			.init(name: "dark_spectrum", imageName: "color_spectrum2_nft", description: "dark_spectrum_nft_description".localized)
		]

		init(onAction: @escaping (ActionType) -> Void) {
			self.onAction = onAction
			setupActions()
		}

		func getAccount() {
			guard let context = modelContext, let email = UserDefaults.userEmail else { return }

			getAccountUseCase.execute(email: email, context: context)
				.receive(on: DispatchQueue.main)
				.sink { completion in
					switch completion {
						case .failure(let error):
							Debug.error(error)
						case .finished:
							break
					}
				} receiveValue: { [weak self] account in
					guard let self, let balance = account.balance else { return }
					accountModel = account
					currentBalance = balance
				}
				.store(in: &cancellables)
		}

		func setContext(_ context: ModelContext) {
			self.modelContext = context
			self.getAccount()
		}

		private func setupActions() {
			actions = [
				.init(id: 1, icon: .receive, title: "receive".localized, action: { self.onAction(.receive) }),
				.init(id: 2, icon: .send, title: "send".localized, action: { self.onAction(.send) }),
				.init(id: 3, icon: .swap, title: "swap".localized, action: { self.onAction(.swap) }),
				.init(id: 4, icon: .buy, title: "buy".localized, action: { self.onAction(.buy) })
			]
		}
	}
}
