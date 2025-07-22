//
//  NotificationsPermissionScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 21/07/2025.
//

import SwiftUI

public struct NotificationsPermissionScreen: View {

	private let onAction: () -> Void

	public init(onAction: @escaping () -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		VStack {
			content
			cta
		}
		.padding(.horizontal, UI.Spacing.level07)
		.background(.textPrimary)
	}

	private var content: some View {
		ScrollView(showsIndicators: false) {
			Spacer(minLength: 50)

			VStack(spacing: .zero) {
				Image.onboarding_notifications
					.resizable()
					.scaledToFit()
					.frame(maxWidth: 200, maxHeight: 200)

				VStack(spacing: UI.Spacing.level04) {
					Text("notifications_permission_title".localized)
						.font(.heading2Bold)
						.foregroundColor(.b0)

					Text("notifications_permission_subtitle".localized)
						.font(.body)
						.fontWeight(.medium)
						.foregroundColor(.textTertiary)
				}
				.multilineTextAlignment(.center)
			}
			.padding(.top, UI.Spacing.level08)

			Spacer(minLength: 50)
		}
	}

	private var cta: some View {
		Button {
			onAction()
		} label: {
			Text("enable".localized)
		}
		.buttonStyle(PrimaryButton(.large, color: .b0, titleColor: .textPrimary))
		.padding(.bottom, UI.Spacing.level06)
	}
}
