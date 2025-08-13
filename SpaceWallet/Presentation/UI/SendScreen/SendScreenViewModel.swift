//
//  SendScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 13/08/2025.
//

import Foundation

extension SendScreen {
	@Observable
	@MainActor
	final class ViewModel {

		@ObservationIgnored
		var searchString = ""

		init() {

		}
	}
}

