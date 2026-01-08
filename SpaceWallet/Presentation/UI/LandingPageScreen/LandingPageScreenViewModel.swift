//
//  LandingPageScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import SwiftUI

extension LandingPageScreen {
	@Observable
	@MainActor
	final class ViewModel {

		private let networkManager = NetworkManager()
		var isConnected: Bool = true

		init() {
            Task { @MainActor in
                await observeNetworkStatus()
            }
		}

        func observeNetworkStatus() async {
            for await connected in networkManager.isConnectedStream {
                self.isConnected = connected
            }
        }
	}
}
