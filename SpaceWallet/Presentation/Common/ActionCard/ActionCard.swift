//
//  ActionCard.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftUI

struct ActionCard: View {

	let model: ActionCardModel

	var body: some View {
		Button(action: model.action) {
			VStack(spacing: UI.Spacing.level04) {
				model.icon
					.resizable()
					.frame(width: 24, height: 24)
					.scaledToFit()
				Text(model.title)
					.font(.heading5SemiBold)
					.foregroundStyle(.textPrimary)
			}
			.frame(width: 74, height: 74)
			.background(.b0)
			.contentShape(Rectangle())
			.cornerRadius(UI.Corner.l)
		}
	}
}
