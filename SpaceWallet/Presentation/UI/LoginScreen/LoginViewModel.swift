//
//  LoginViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 04/07/2025.
//

import SwiftUI

extension LoginScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var illustrationIndex: Illustration = .first

		func updateIllustration(for index: Int) {
			illustrationIndex = Illustration(rawValue: index) ?? .first
		}
	}
}
