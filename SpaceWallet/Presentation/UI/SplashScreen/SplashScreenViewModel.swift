//
//  SplashScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

extension SplashScreen {
	@Observable
	@MainActor
	final class ViewModel {

		private var networkManager = NetworkManager()
		private var wasNotificationRequested: Bool = false
		private var onCompletion: (SplashScreenRoute) -> Void

		var isConnected = false

		init(onCompletion: @escaping (SplashScreenRoute) -> Void) {
			self.onCompletion = onCompletion
            Task { await checkSession() }
		}

        func checkSession() async {
            await observeNetworkStatus()
        }

        @MainActor
        private func observeNetworkStatus() async {
            for await isConnected in networkManager.isConnectedStream {
                self.isConnected = isConnected

                if !isConnected {
                    onCompletion(.internetConnectionError)
                    return
                }

                if shouldRequestNotificationPermission() {
                    onCompletion(.notificationsPermission)
                } else {
                    onCompletion(.login)
                }
                break
            }
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
