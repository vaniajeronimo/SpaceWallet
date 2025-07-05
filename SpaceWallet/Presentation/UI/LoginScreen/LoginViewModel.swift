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

		private var onAction: (ActionType) -> Void

		var illustrationIndex: Illustration = .first

		init(onAction: @escaping (ActionType) -> Void) {
			self.onAction = onAction
		}

		func updateIllustration(for index: Int) {
			illustrationIndex = Illustration(rawValue: index) ?? .first
		}

		func handleAction(with action: AuthCard.ActionType) {
			switch action {
				case .onNewIndex(let index):
					updateIllustration(for: index)
				case .onContinue:
					onAction(.onContinue)
				default:
					break
			}
		}
	}
}
