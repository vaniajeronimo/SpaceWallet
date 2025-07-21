//
//  SettingsScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import Combine
import Factory
import SwiftData
import SwiftUI

extension SettingsScreen {
	@Observable
	@MainActor
	final class ViewModel {

		@ObservationIgnored
		@Injected(\.updateCurencyUseCase)
		private var updateCurencyUseCase

		private var modelContext: ModelContext?
		private var cancellables = Set<AnyCancellable>()

		var selectedCurrency: CurrencySelectableModel.Currency?

		var currencyList = [
			CurrencySelectableModel.Currency(id: 1, name: "euro".localized, currency: "€", iconName: "european_union"),
			CurrencySelectableModel.Currency(id: 2, name: "pound".localized, currency: "£", iconName: "united_kingdom"),
			CurrencySelectableModel.Currency(id: 3, name: "usd".localized, currency: "$", iconName: "united_states"),
			CurrencySelectableModel.Currency(id: 4, name: "japanese_yen".localized, currency: "¥", iconName: "japan")
		]

		init() {
			currencyList.sort { $0.name < $1.name }
		}

		func setContext(_ context: ModelContext) {
			self.modelContext = context
			self.updateCurrency()
		}

		func updateCurrency() {
			guard let modelContext,
				  let email = UserDefaults.userEmail,
				  let currencySymbol = selectedCurrency?.currency,
				  let newCurrency = CurrencySwiftDataEntity(symbol: currencySymbol) else {
				return
			}
			updateCurencyUseCase.execute(email: email, newCurrency: newCurrency, context: modelContext)
				.receive(on: DispatchQueue.main)
				.sink { completion in
					switch completion {
						case .failure(let error):
							Debug.error(error)
						case .finished:
							break
					}
				} receiveValue: { currency in
					print(currency)
				}
				.store(in: &cancellables)
		}
	}
}
