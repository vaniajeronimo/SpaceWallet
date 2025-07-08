//
//  HomeScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import Combine
import SwiftUI

extension HomeScreen {
	@Observable
	@MainActor
	final class ViewModel {

		private let networkManager = NetworkManager()

		var isConnected: Bool = true

		private var cancellables = Set<AnyCancellable>()

		init() {
			observeNetworkStatus()
		}

		func observeNetworkStatus() {
			executeInBackgroundThread({
				self.networkManager.$isConnected
					.receive(on: DispatchQueue.main)
					.sink { [weak self] connected in
						guard let self else { return }
						isConnected = connected
					}
					.store(in: &self.cancellables)
			}, after: 0.5)
		}
	}
}
