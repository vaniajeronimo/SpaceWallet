//
//  ConfirmPhoneNumberBottomSheet.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

extension ConfirmPhoneNumberScreen {

	var countriesBottomSheet: some View {
		SelectableBottomSheet(
			title: "country_prefix_code".localized,
			height: 603,
			items: viewModel.countries,
			selectedItem: $viewModel.selectedCountry,
			onSelectedCallback: { selectedCountry in
				viewModel.selectedCountry = selectedCountry
				viewModel.isToShowBottomSheet = false
			},
			onClose: {
				viewModel.selectedCountry = nil
				viewModel.isToShowBottomSheet = false
			}, isShowing: $viewModel.isToShowBottomSheet
		)
	}
}
