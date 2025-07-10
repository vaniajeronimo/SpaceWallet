//
//  SelectableBottomSheetViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import Combine
import SwiftUI

extension SelectableBottomSheet {
	@Observable
	@MainActor
	final class ViewModel {

		var searchString = ""
		var items: [T]

		private let itemsFullList: [T]

		@ObservationIgnored
		private var cancellables = Set<AnyCancellable>()

		init(items: [T], itemsFullList: [T]) {
			self.items = items
			self.itemsFullList = itemsFullList
		}

		private func searchItem(_ searchText: String?) {
			guard let text = searchText?.trimmingCharacters(in: .whitespacesAndNewlines),
				  text.isNotEmpty else {
				self.items = itemsFullList
				return
			}
			self.items = searchItems(text)
		}

		private func searchItems(_ searchText: String) -> [T] {
			guard searchText.trimmingCharacters(in: .whitespacesAndNewlines).isNotEmpty else {
				return []
			}
			return itemsFullList.filter { model in
				model.name.range(of: searchText, options: .caseInsensitive) != nil ||
				model.iconName.range(of: searchText, options: .caseInsensitive) != nil
			}
		}

		func observeQuery(with searchString: String) {
			Task {
				do {
					try await Task.sleep(for: .milliseconds(100))

					if !Task.isCancelled {
						await MainActor.run {
							if searchString.isEmpty {
								items = itemsFullList
							} else {
								items = searchItems(searchString.uppercased())
							}
						}
					}
				} catch {
					Debug.error(error)
				}
			}
		}
	}
}
