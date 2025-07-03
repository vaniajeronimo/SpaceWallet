//
//  SplashScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import FirebaseAuth
import Foundation

extension SplashScreen {
	@Observable
	final class ViewModel {

		private var onCompletion: (SplashScreenRoute) -> Void
		private var authStateListener: AuthStateDidChangeListenerHandle?

		init(onCompletion: @escaping (SplashScreenRoute) -> Void) {
			self.onCompletion = onCompletion
			self.setupAuthListener()
		}

		deinit {
			if let listener = authStateListener {
				Auth.auth().removeStateDidChangeListener(listener)
			}
		}

		private func setupAuthListener() {
			executeInMainThread({
				self.authStateListener = Auth.auth().addStateDidChangeListener { [weak self] _, user in
					if let listener = self?.authStateListener {
						Auth.auth().removeStateDidChangeListener(listener)
					}

					Task { @MainActor in
						if user != nil {
							self?.onCompletion(.home)
						} else {
							self?.onCompletion(.login)
						}
					}
				}
			}, after: 3.5)
		}
	}
}
