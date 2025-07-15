//
//  ColorExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public extension Color {

	static let background_0 = Color("b0", bundle: Bundle.main)
	static let blue = Color("blue_default", bundle: Bundle.main)
	static let violet = Color("violet_default", bundle: Bundle.main)
	static let violet_hover = Color("violet_hover", bundle: Bundle.main)
	static let violet_stroke = Color("violet_stroke", bundle: Bundle.main)
	static let gray300 = Color("gray_tertiary", bundle: Bundle.main)
	static let gray400 = Color("gray_quaternary", bundle: Bundle.main)
	static let text3 = Color("text_tertiary", bundle: Bundle.main)

	enum Gradient {
		static let violetStart = Color("violet_start", bundle: Bundle.main)
		static let violetEnd = Color("violet_end", bundle: Bundle.main)
	}
}

public extension LinearGradient {

	static let violetPrimary = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .violetStart, location: 0.0),
			.init(color: .violetEnd, location: 0.5),
			.init(color: .white, location: 1.0)
		]),
		startPoint: .top,
		endPoint: .bottom
	)

	static let violetSecondary = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .violetStart, location: 0.0),
			.init(color: .violetEnd, location: 0.5)
		]),
		startPoint: .top,
		endPoint: .bottom
	)

	static let violetTertiary = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .violetStart, location: 0.0),
			.init(color: .violetEnd, location: 0.4),
			.init(color: .white, location: 0.75),
			.init(color: .pinkStroke, location: 1.0)
		]),
		startPoint: .topLeading,
		endPoint: .bottomTrailing
	)

	static let greenPrimary = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .greenStroke, location: 0.0),
			.init(color: .greenFill, location: 0.4),
			.init(color: .violetFill, location: 0.75),
			.init(color: .white, location: 1.0)
		]),
		startPoint: .top,
		endPoint: .bottom
	)

	static let greenSecondary = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .greenStroke, location: 0.0),
			.init(color: .violetFill, location: 0.3),
			.init(color: .violetFill, location: 0.75),
			.init(color: .white, location: 1.0)
		]),
		startPoint: .top,
		endPoint: .bottom
	)

	static let redPrimary = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .redStroke, location: 0.0),
			.init(color: .white, location: 0.5)
		]),
		startPoint: .top,
		endPoint: .bottom
	)
}
