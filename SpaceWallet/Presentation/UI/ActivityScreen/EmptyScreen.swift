//
//  EmptyScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public struct EmptyScreen: View {

	private let gradient: LinearGradient?
	private let screenTitle: String
	private let image: Image
	private let title: String
	private let subtitle: String
	private let onAction: () -> Void

	public init(
		gradient: LinearGradient? = nil,
		screenTitle: String,
		image: Image,
		title: String,
		subtitle: String,
		onAction: @escaping () -> Void
	) {
		self.gradient = gradient
		self.screenTitle = screenTitle
		self.image = image
		self.title = title
		self.subtitle = subtitle
		self.onAction = onAction
	}

	public var body: some View {
		VStack(spacing: .zero) {
			VStack {
				navBar
				ScrollView {
					VStack {
						content
					}
				}
			}
		}
		.padding(.horizontal, UI.Spacing.level06)
		.background(gradient)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
	}

	private var navBar: some View {
		HStack(alignment: .center) {
			Spacer()

			Text(screenTitle)
				.font(.heading3Bold)
				.foregroundStyle(.textPrimary)

			Spacer()

			Button {
				onAction()
			} label: {
				Image.dots
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
					.padding(18)
					.background(Circle().fill(Color.fillTertiary))
			}
		}
		.frame(height: 40)
		.padding(.top, UI.Spacing.level05)
	}

	private var content: some View {
		VStack {
			Image.empty_cart_retro
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 300, maxHeight: 300)

			VStack(alignment: .center, spacing: UI.Spacing.level04) {
				Text(title)
					.font(.heading1Bold)
					.foregroundStyle(.textPrimary)
				Text(subtitle)
					.font(.body)
					.fontWeight(.medium)
					.foregroundStyle(.textSecondary)
			}
			.multilineTextAlignment(.center)
		}
		.padding(.top, UI.Spacing.level08)
		.frame(maxWidth: .infinity)
	}
}
