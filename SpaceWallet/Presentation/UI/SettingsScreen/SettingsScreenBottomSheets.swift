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
				isToShowCurrencyBottomSheet = false
			},
			onClose: {
				viewModel.selectedCurrency = nil
				isToShowCurrencyBottomSheet = false
			}, isShowing: $isToShowCurrencyBottomSheet
		)
	}

	var notificationsBottomSheet: some View {
		CustomBottomSheet(
			isShowing: $isToShowNotificationsBottomSheet,
			height: 465,
			onDismiss: {
				isToShowNotificationsBottomSheet = false
			}, content: {
				ScrollView {
					VStack {
						Image.onboarding_notifications
							.resizable()
							.scaledToFit()
							.frame(width: 200, height: 200)
							.padding(.top, -UI.Spacing.level07)

						VStack(spacing: UI.Spacing.level04) {
							Text("notifications_permission_title".localized)
								.font(.heading2Bold)
								.foregroundColor(.b0)

							Text("notifications_permission_subtitle".localized)
								.font(.body)
								.fontWeight(.medium)
								.foregroundColor(.textTertiary)
								.multilineTextAlignment(.center)
						}
						.frame(maxWidth: .infinity)

						Button {
							DeviceSettingsHelper.openDeviceSettings()
						} label: {
							Text("manage_notifications".localized)
						}
						.buttonStyle(PrimaryButton(.large, color: .b0, titleColor: .textPrimary))
						.padding(.top, UI.Spacing.level07)
					}
					.padding(.horizontal, UI.Spacing.level07)
				}
			}
		)
		.bottomPadding(UI.Spacing.level07)
	}
}
