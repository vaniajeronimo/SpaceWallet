//
//  SplashScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Combine
import Factory
import FirebaseAuth

extension SplashScreen {
	@Observable
	@MainActor
	final class ViewModel {

		@ObservationIgnored
		@Injected(\.checkAuthStateUseCase)
		private var checkAuthStateUseCase

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
						checkAuthState()
					}
				}
				.store(in: &cancellables)
		}

		private func checkAuthState() {
			checkAuthStateUseCase.execute()
				.receive(on: DispatchQueue.main)
				.sink(receiveCompletion: { [weak self] completion in
					guard let self else { return }
					switch completion {
						case .failure(let error):
							Debug.error(error)
							onCompletion(.genericError)
						case .finished:
							break
					}
				}, receiveValue: { [weak self] destination in
					guard let self else { return }
					switch destination {
						case .home:
							onCompletion(.home)
						case .login:
							onCompletion(.login)
					}
				})
				.store(in: &cancellables)
		}
	}
}
