//
//  ColorExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public extension Color {

	enum Gradient {
		static let violetStart = Color("violet_start", bundle: Bundle.main)
		static let violetEnd = Color("violet_end", bundle: Bundle.main)
	}
}

public extension LinearGradient {

	static let violetGradient = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .violetStart, location: 0.0),
			.init(color: .violetEnd, location: 0.5),
			.init(color: .white, location: 1.0)
		]),
		startPoint: .top,
		endPoint: .bottom
	)

	static let greenGradient = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .greenStroke, location: 0.0),
			.init(color: .white, location: 0.5)
		]),
		startPoint: .top,
		endPoint: .bottom
	)

	static let redGradient = LinearGradient(
		gradient: Gradient(stops: [
			.init(color: .redStroke, location: 0.0),
			.init(color: .white, location: 0.5)
		]),
		startPoint: .top,
		endPoint: .bottom
	)
}

