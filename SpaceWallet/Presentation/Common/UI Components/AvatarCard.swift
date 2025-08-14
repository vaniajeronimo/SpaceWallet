//
//  AvatarCard.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/08/2025.
//

import SwiftUI

public struct AvatarCard: View {

	private let model: AvatarModel
	private let onTap: () -> Void

	public init(model: AvatarModel, onTap: @escaping () -> Void) {
		self.model = model
		self.onTap = onTap
	}

	public var body: some View {
		content
	}

	private var content: some View {
		HStack(alignment: .center, spacing: UI.Spacing.level05) {
			model.icon
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 40, maxHeight: 40)

			VStack(alignment: .leading) {
				Text(model.name)
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundColor(.textPrimary)

				Text(model.transactions)
					.font(.body)
					.fontWeight(.medium)
					.foregroundColor(.graySecondary)
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.vertical, UI.Spacing.level03)
		.onTapGesture {
			onTap()
		}
	}
}
