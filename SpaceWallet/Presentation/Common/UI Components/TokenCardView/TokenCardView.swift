//
//  TokenCardView.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 30/07/2025.
//

import SwiftUI

public struct TokenCardView: View {

	private var model: TokenModel
	private var onTap: (() -> Void)?

	public init(
		model: TokenModel,
		onTap: (() -> Void)? = nil
	) {
		self.model = model
		self.onTap = onTap
	}

	public var body: some View {
		HStack(alignment: .center, spacing: UI.Spacing.level04) {
			Image(model.icon)
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 40, maxHeight: 40)

			VStack(alignment: .leading, spacing: UI.Spacing.level02) {
				Text(model.tokenName)
					.font(.heading4SemiBold)
					.foregroundStyle(.textPrimary)
				Text("\(model.amount?.formattedAmount() ?? "") \(model.tokenSymbol)")
					.font(.body)
					.fontWeight(.medium)
					.foregroundStyle(.graySecondary)
			}

			Spacer()

			VStack(alignment: .trailing, spacing: UI.Spacing.level02) {
				Text(model.value?.asCurrency(symbol: "$") ?? "")
					.font(.heading4SemiBold)
					.foregroundStyle(.textPrimary)
				if let profit = model.profit {
					Text("\(profit.formattedPercentageWithSign())")
						.font(.body)
						.fontWeight(.medium)
						.foregroundStyle(.greenActive)
				}
			}
		}
		.padding(UI.Spacing.level05)
		.background(
			RoundedRectangle(cornerRadius: UI.Corner.l)
				.fill(Color.fillQuaternary)
		)
		.onTapGesture {
			onTap?()
		}
	}
}
