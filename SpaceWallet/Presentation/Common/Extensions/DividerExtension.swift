//
//  DividerExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 04/07/2025.
//

import SwiftUI

public extension Divider {

	@ViewBuilder
	func custom(
		height: CGFloat = 0.5,
		color: Color = .text3
	) -> some View {
		self
			.frame(maxWidth: .infinity, maxHeight: height)
			.overlay(color)
	}
}
