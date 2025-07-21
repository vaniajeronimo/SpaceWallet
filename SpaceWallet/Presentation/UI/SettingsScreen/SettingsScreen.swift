//
//  AccountScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import SwiftUI

struct SettingsScreen: View {

	private let onAction: (ActionType) -> Void

	var userName: String {
		guard let email = UserDefaults.userEmail,
			  let name = email.split(separator: "@").first else {
			return ""
		}
		return String(name)
	}

	init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	var body: some View {
		VStack {
			navBar
			profileCard
			Spacer()
		}
		.padding(.top, UI.Spacing.level05)
		.padding(.horizontal, UI.Spacing.level07)
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
			Image.profile_large
				.frame(width: 48, height: 48)

			VStack(alignment: .leading, spacing: UI.Spacing.level02) {
				Text(userName)
					.font(.heading5SemiBold)
					.foregroundStyle(.textPrimary)

				Text(UserDefaults.userEmail ?? "")
					.font(.body)
					.fontWeight(.medium)
					.foregroundStyle(.graySecondary)
			}
			Spacer()
		}
		.padding(16)
		.background(Color.fillQuaternary)
		.clipShape(RoundedRectangle(cornerRadius: 16))
		.padding(.top, 24)
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}

extension SettingsScreen {

	enum ActionType {
		case close
	}
}
