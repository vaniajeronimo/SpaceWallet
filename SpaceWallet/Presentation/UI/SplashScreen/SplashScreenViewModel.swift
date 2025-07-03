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

		private var cancellables = Set<AnyCancellable>()
		private var onCompletion: (SplashScreenRoute) -> Void

		init(onCompletion: @escaping (SplashScreenRoute) -> Void) {
			self.onCompletion = onCompletion
			executeInMainThread({
				self.checkSession()
			}, after: 3.0)
		}

		private func checkSession() {
			checkAuthStateUseCase.execute()
				.receive(on: DispatchQueue.main)
				.sink(receiveCompletion: { completion in
					switch completion {
						case .failure(let error):
							print(error.localizedDescription)
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
