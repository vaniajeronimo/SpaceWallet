//
//  ConfirmPhoneNumberScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

extension ConfirmPhoneNumberScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var selectedCountry: CountriesModel.Country?
		var phoneNumber: String = ""
		var isToShowBottomSheet: Bool = false

		var prefix: String {
			selectedCountry?.prefix ?? "+351"
		}

		var userPhoneNumber: String {
			"\(prefix) \(phoneNumber)"
		}

		var disableCta: Bool {
			phoneNumber.isEmpty || phoneNumber.count < 8
		}

		var countries = [
			CountriesModel.Country(id: 1, name: "Portugal", prefix: "+351", iconName: "portugal"),
			CountriesModel.Country(id: 2, name: "Spain", prefix: "+34", iconName: "spain"),
			CountriesModel.Country(id: 3, name: "Italy", prefix: "+39", iconName: "italy"),
			CountriesModel.Country(id: 4, name: "USA", prefix: "+1", iconName: "united_states"),
			CountriesModel.Country(id: 5, name: "UK", prefix: "+44", iconName: "united_kingdom"),
			CountriesModel.Country(id: 6, name: "France", prefix: "+33", iconName: "france"),
			CountriesModel.Country(id: 7, name: "Germany", prefix: "+49", iconName: "germany"),
			CountriesModel.Country(id: 8, name: "Netherlands", prefix: "+31", iconName: "netherlands"),
			CountriesModel.Country(id: 9, name: "Sweden", prefix: "+46", iconName: "sweden"),
			CountriesModel.Country(id: 10, name: "Norway", prefix: "+47", iconName: "norway"),
			CountriesModel.Country(id: 11, name: "Switzerland", prefix: "+41", iconName: "switzerland")
		]

		init() {
			countries.sort { $0.name < $1.name }
		}

		func clearPhoneNumber() {
			phoneNumber = ""
			selectedCountry?.prefix = "+351"
		}
	}
}
