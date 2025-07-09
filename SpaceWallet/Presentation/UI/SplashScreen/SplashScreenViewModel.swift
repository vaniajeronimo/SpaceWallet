//
//  SplashScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import SwiftUI

extension SplashScreen {
	@Observable
	@MainActor
	final class ViewModel {

		private var networkManager = NetworkManager()

		private var cancellables = Set<AnyCancellable>()
		private var onCompletion: (SplashScreenRoute) -> Void

		var isConnected = false

		init(onCompletion: @escaping (SplashScreenRoute) -> Void) {
			self.onCompletion = onCompletion
			self.checkSession()
		}

		func checkSession() {
			executeInMainThread({
				self.observeNetworkStatus()
			}, after: 1.5)
		}

		private func observeNetworkStatus() {
			networkManager.$isConnected
				.receive(on: DispatchQueue.main)
				.sink { [weak self] connected in
					guard let self else { return }
					isConnected = connected

					if !isConnected {
						onCompletion(.internetConnectionError)
					} else {
						onCompletion(.login)
					}
				}
				.store(in: &cancellables)
		}
	}
}
