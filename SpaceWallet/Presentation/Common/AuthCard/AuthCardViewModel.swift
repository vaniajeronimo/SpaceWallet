//
//  AuthCardViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

extension AuthCard {
	@Observable
	final class ViewModel {

		let steps: [CarrouselModel]

		init() {
			steps = Array(1...3).map {
				CarrouselModel(
					title: "auth_card_carrousel_\($0)_title".localized
				)
			}
		}
	}
}
