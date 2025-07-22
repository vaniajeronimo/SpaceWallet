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
		ZStack {
			VStack(spacing: .zero) {
				Image.onboarding_notifications
					.resizable()
					.scaledToFit()
					.frame(maxWidth: 200, maxHeight: 200)

				VStack(spacing: UI.Spacing.level04) {
					Text("notifications_permission_title".localized)
						.font(.heading2Bold)
						.foregroundColor(.b0)

					Text("notifications_permission_description".localized)
						.font(.body)
						.fontWeight(.medium)
						.foregroundColor(.textTertiary)
				}
				.multilineTextAlignment(.center)
			}
		}
		.background(.textPrimary)
		.ignoresSafeArea()
	}
}
