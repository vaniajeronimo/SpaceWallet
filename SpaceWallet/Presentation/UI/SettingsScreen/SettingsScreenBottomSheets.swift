//
//  SettingsScreenBottomSheets.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import SwiftUI

extension SettingsScreen {

	var currencyBottomSheet: some View {
		SelectableBottomSheet(
			title: "local_currency_title".localized,
			height: 503,
			items: viewModel.currencyList,
			selectedItem: $viewModel.selectedCurrency,
			onSelectedCallback: { selectedCurrency in
				viewModel.selectedCurrency = selectedCurrency
				isToShowBottomSheet = false
			},
			onClose: {
				viewModel.selectedCurrency = nil
				isToShowBottomSheet = false
			}, isShowing: $isToShowBottomSheet
		)
	}
}
