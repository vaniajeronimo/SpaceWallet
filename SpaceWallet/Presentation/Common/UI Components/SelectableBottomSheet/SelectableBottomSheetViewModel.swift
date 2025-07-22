//
//  SelectableBottomSheetViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

extension SelectableBottomSheet {
	@Observable
	@MainActor
	final class ViewModel {

		var items: [T]

		init(items: [T]) {
			self.items = items
		}
	}
}
