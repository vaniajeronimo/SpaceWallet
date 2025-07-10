//
//  SelectableItem.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

struct SelectableItemRow: View {

	let iconName: String
	let title: String
	let isSelected: Bool
	let onTap: () -> Void

	var body: some View {
		HStack(spacing: UI.Spacing.level05) {
			Image(iconName)
				.resizable()
				.scaledToFit()
				.frame(width: 24, height: 24)

			Text(title)
				.font(.heading4SemiBold)
				.foregroundStyle(.b0)

			Spacer()

			if isSelected {
				Image.checkmark
					.resizable()
					.scaledToFit()
					.frame(width: 24, height: 24)
			}
		}
		.padding(.horizontal, UI.Spacing.level07)
		.frame(height: 60)
		.frame(maxWidth: .infinity)
		.background(Color.white.opacity(0.05))
		.cornerRadius(16)
		.padding(.horizontal, 24)
		.contentShape(Rectangle())
		.onTapGesture {
			onTap()
		}
	}
}
