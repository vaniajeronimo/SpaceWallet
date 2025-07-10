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

		var phoneNumber: String = ""

		init() { }

		func clearPhoneNumber() {
			phoneNumber = ""
		}
	}
}
