//
//  AccountScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import SwiftData
import SwiftUI

struct SettingsScreen: View {

	@State private var isToShowAlert: Bool = false
	@State var isToShowBottomSheet: Bool = false

	@Bindable var viewModel = ViewModel()

	private var context: ModelContext
	private let onAction: (ActionType) -> Void

	init(context: ModelContext, onAction: @escaping (ActionType) -> Void) {
		self.context = context
		self.onAction = onAction
	}

	var body: some View {
		ZStack {
			VStack {
				navBar
				profileCard
				preferences
				settings
				Spacer()
			}
			.padding(.top, UI.Spacing.level05)
			.padding(.horizontal, UI.Spacing.level07)

			currencyBottomSheet
		}
		.alert("generic_alert_title".localized, isPresented: $isToShowAlert) {
			Button("ok".localized, role: .cancel) {
				isToShowAlert = false
			}
		}
		.onAppear {
			viewModel.setContext(context)
		}
	}

	private var navBar: some View {
		HStack(alignment: .center) {
			Spacer()

			Text("your_account_title".localized)
				.font(.heading2Bold)

			Spacer()

			closeButton
		}
	}

	private var closeButton: some View {
		Button {
			viewModel.updateCurrency()
			onAction(.close)
		} label: {
			ZStack {
				Circle()
					.fill(.fillTertiary)

				Image.close_outline
					.resizable()
					.scaledToFit()
					.frame(width: 24, height: 24)
					.foregroundColor(.textPrimary)
			}
			.frame(width: 40, height: 40)
		}
		.contentShape(Circle())
	}

	private var profileCard: some View {
		HStack(alignment: .center, spacing: 10) {
			Image.profile
				.frame(width: 48, height: 48)

			VStack(alignment: .leading, spacing: UI.Spacing.level02) {
				if let userName = UserDefaults.userName, let userEmail = UserDefaults.userEmail {
					Text(userName)
						.font(.heading5SemiBold)
						.foregroundStyle(.textPrimary)
					Text(userEmail)
						.font(.body)
						.fontWeight(.medium)
						.foregroundStyle(.graySecondary)
				}
			}
			Spacer()
		}
		.padding(UI.Spacing.level05)
		.background(Color.fillQuaternary)
		.clipShape(RoundedRectangle(cornerRadius: UI.Corner.l))
		.padding(.top, UI.Spacing.level07)
		.frame(maxWidth: .infinity, alignment: .leading)
	}

	private var preferences: some View {
		VStack(alignment: .leading, spacing: UI.Spacing.level02) {
			Text("preferences_title".localized)
				.font(.heading5SemiBold)
				.foregroundColor(.textTertiary)
				.padding(.bottom, UI.Spacing.level04)

			createRow(icon: .appearance, title: "appearance_title".localized, action: {
				isToShowAlert = true
			})
			createRow(icon: .currency, title: "currency_title".localized, action: {
				isToShowBottomSheet = true
			})
			createRow(icon: .notification, title: "notification_title".localized, action: {
				isToShowAlert = true
			})
			createRow(icon: .privacy, title: "privacy_title".localized, action: {
				isToShowAlert = true
			})
		}
		.padding(.top, UI.Spacing.level07)
	}

	private var settings: some View {
		VStack(alignment: .leading, spacing: UI.Spacing.level02) {
			Text("settings_title".localized)
				.font(.heading5SemiBold)
				.foregroundColor(.textTertiary)
				.padding(.bottom, UI.Spacing.level04)

			createRow(icon: .face_id_settings, title: "face_id_title".localized, action: {
				isToShowAlert = true
			})
			createRow(icon: .recovery_phrase, title: "recovery_phrase_title".localized, action: {
				isToShowAlert = true
			})
			createRow(icon: .icloud_backup, title: "icloud_backup_title".localized, action: {
				isToShowAlert = true
			})
		}
		.padding(.top, UI.Spacing.level07)
	}

	private func createRow(icon: Image, title: String, action: @escaping () -> Void) -> some View {
		Button {
			action()
		} label: {
			HStack(alignment: .center, spacing: 12) {
				icon
					.frame(width: 20, height: 20)

				Text(title)
					.font(.body)
					.fontWeight(.medium)
					.foregroundColor(.textPrimary)

				Spacer()

				Image.chevron_right
					.frame(width: 20, height: 20)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: 48)
	}
}

extension SettingsScreen {

	enum ActionType {
		case close
	}
}
