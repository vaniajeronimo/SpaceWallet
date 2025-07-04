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

		var attributedText: AttributedString {
			var text = AttributedString("terms_and_conditions_info_note".localized)

			let highlights = [
				"terms_and_conditions".localized,
				"privacy_policy".localized
			]

			for phrase in highlights {
				if let range = text.range(of: phrase) {
					text[range].foregroundColor = .textPrimary
					text[range].underlineStyle = .none
					let captionSize = UIFont.preferredFont(forTextStyle: .caption1).pointSize
					text[range].font = .system(size: captionSize, weight: .semibold, design: .default)
				}
			}
			return text
		}

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
