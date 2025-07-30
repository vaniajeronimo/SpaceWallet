//
//  TokenCardView.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 30/07/2025.
//

import SwiftUI

public struct TokenCardView: View {
	let icon: String
	let title: String
	let subtitle: String
	let symbol: String
	let value: String
	let profit: String
	let color: Color

	public init(
		icon: String,
		title: String,
		subtitle: String,
		symbol: String,
		value: String,
		profit: String,
		color: Color
	) {
		self.icon = icon
		self.title = title
		self.subtitle = subtitle
		self.symbol = symbol
		self.value = value
		self.profit = profit
		self.color = color
	}

	public var body: some View {
		HStack(alignment: .center, spacing: UI.Spacing.level04) {
			Image(icon)
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 40, maxHeight: 40)

			VStack(alignment: .leading, spacing: UI.Spacing.level02) {
				Text(title)
					.font(.heading4SemiBold)
					.foregroundStyle(.textPrimary)
				Text("\(subtitle) \(symbol)")
					.font(.body)
					.fontWeight(.medium)
					.foregroundStyle(.graySecondary)
			}

			Spacer()

			VStack(alignment: .trailing, spacing: UI.Spacing.level02) {
				Text(value)
					.font(.heading4SemiBold)
					.foregroundStyle(.textPrimary)
				Text(profit)
					.font(.body)
					.fontWeight(.medium)
					.foregroundStyle(color)
			}
		}
		.padding(UI.Spacing.level05)
		.background(
			RoundedRectangle(cornerRadius: UI.Corner.l)
				.fill(Color.fillQuaternary)
		)
	}
}
