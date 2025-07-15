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
			VStack(spacing: UI.Spacing.level03) {
				model.icon
					.resizable()
					.frame(width: 24, height: 24)
					.scaledToFit()
				Text(model.title)
					.font(.heading5SemiBold)
					.foregroundStyle(.textPrimary)
			}
			.frame(width: 74, height: 74)
			.background(Color.b0.blur(radius: 16))
			.clipShape(RoundedRectangle(cornerRadius: UI.Corner.l))
			.overlay(
				RoundedRectangle(cornerRadius: UI.Corner.l)
					.stroke(Color.white, lineWidth: UI.Border.s)
			)
		}
	}
}
