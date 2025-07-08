//
//  AuthCard.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

public struct CardView: ViewModifier {
	public func body(content: Content) -> some View {
			content
			.padding(20)
			.frame(maxWidth: .infinity)
			.background(Color.white.blur(radius: 20))
			.clipShape(RoundedRectangle(cornerRadius: 40))
			.overlay(
				RoundedRectangle(cornerRadius: 40)
					.stroke(Color.white, lineWidth: 1)
			)
	}
}

public extension View {
	func setCardView() -> some View {
		self.modifier(CardView())
	}
}
