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
	@State var isToShowCurrencyBottomSheet: Bool = false
	@State var isToShowLanguageBottomSheet: Bool = false
	@State var isToShowNotificationsBottomSheet: Bool = false

	@Bindable var viewModel = ViewModel()

	private var context: ModelContext

	init(context: ModelContext) {
		self.context = context
	}

	var body: some View {
		ZStack {
			ScrollView(showsIndicators: false) {
				Spacer(minLength: UI.Spacing.level07)

				VStack {
					profileCard
					preferences
					settings
					Spacer()
				}
				.padding(.horizontal, UI.Spacing.level07)
			}
			currencyBottomSheet
			languageBottomSheet
			notificationsBottomSheet
		}
		.onAppear {
			viewModel.setContext(context)
		}
		.alert("generic_alert_title".localized, isPresented: $isToShowAlert) {
			Button("ok".localized, role: .cancel) {
				isToShowAlert = false
			}
		}
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
				isToShowCurrencyBottomSheet = true
			})
			createRow(icon: .notification, title: "notification_title".localized, action: {
				isToShowNotificationsBottomSheet = true
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

			createRow(icon: .language, title: "language_title".localized, action: {
				isToShowLanguageBottomSheet = true
			})
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
			HStack(alignment: .center, spacing: UI.Spacing.level04) {
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
		.frame(maxWidth: .infinity)
		.frame(height: 48)
	}
}
