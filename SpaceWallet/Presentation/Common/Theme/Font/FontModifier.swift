//
//  FontModifier.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

struct FontModifier: ViewModifier {

	@Environment(\.sizeCategory) var sizeCategory

	var style: Font.Style

	func body(content: Content) -> some View {
		content
			.font(.custom(style.fontName, size: style.dynamicFontSize(for: sizeCategory)))
			.lineSpacing(style.lineHeight)
			.setSizeCategory()
	}
}

public extension View {

	func fontViewStyle(_ style: Font.Style) -> some View {
		self
			.modifier(FontModifier(style: style))
			.lineSpacing(style.lineHeight)
	}
}

public extension Text {

	func fontTextStyle(_ style: Font.Style) -> some View {
		self
			.modifier(FontModifier(style: style))
	}

	func fontStyle(_ style: Font.Style) -> some View {
		self
			.fontTextStyle(style)
	}
}
