//
//  ErrorScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import SwiftUI

public struct ErrorScreen: View {

	private let gradient: LinearGradient
	private var title: String?
	private var subtitle: String?
	private var buttonTitle: String
	private var buttonSizeMode: ButtonSizeMode
	private let onAction: (() -> Void)?

	public init(
		gradient: LinearGradient = .violetPrimary,
		title: String? = "generic_error_title".localized,
		subtitle: String? = "generic_error_message".localized,
		buttonTitle: String = "retry".localized,
		buttonSizeMode: ButtonSizeMode = .fill,
		onAction: (() -> Void)? = nil
	) {
		self.gradient = gradient
		self.title = title
		self.subtitle = subtitle
		self.buttonTitle = buttonTitle
		self.buttonSizeMode = buttonSizeMode
		self.onAction = onAction
	}

	public var body: some View {
		ZStack {
			gradient

			VStack {
				Spacer()

				Image.errorImg

				VStack(alignment: .center, spacing: UI.Spacing.level04) {
					if let title {
						Text(title)
							.foregroundStyle(.textPrimary)
							.font(.heading1Bold)
							.multilineTextAlignment(.center)
					}
					if let subtitle {
						Text(subtitle)
							.foregroundStyle(.grayPrimary)
							.font(.heading4)
							.multilineTextAlignment(.center)
					}
				}

				Spacer()

				if let onAction {
					Button(buttonTitle) {
						onAction()
					}
					.buttonStyle(PrimaryButton(.large))
					.padding(.horizontal, UI.Spacing.level07)
					.frame(height: 100)
				}
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.edgesIgnoringSafeArea(.top)
	}

	public func buttonSizeMode(mode: ButtonSizeMode) -> Self {
		var result = self
		result.buttonSizeMode = mode
		return result
	}
}
