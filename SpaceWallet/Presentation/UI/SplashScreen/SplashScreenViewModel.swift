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

		private var wasNotificationRequested: Bool = false
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
				.sink { [weak self] isConnected in
					guard let self else { return }

					self.isConnected = isConnected

					guard isConnected else {
						onCompletion(.internetConnectionError)
						return
					}

					executeInMainThread({
						self.shouldRequestNotificationPermission() ? self.onCompletion(.notificationsPermission) : self.onCompletion(.login)
					}, after: 1.5)
				}
				.store(in: &cancellables)
		}

		func shouldRequestNotificationPermission() -> Bool {
			if !wasNotificationRequested {
				wasNotificationRequested = true
				return UserDefaults.isFirstNotificationPermissionRequest
			}
			return false
		}
	}
}
