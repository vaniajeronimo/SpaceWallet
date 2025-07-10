//
//  UIDepthExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

public extension UI {

	enum Depth {
		case noDepth
		case level1
		case level2
		case level3
		case level4
		case manual(color: Color = .black.opacity(0.1), radius: CGFloat = 0, x: CGFloat = 0, y: CGFloat = 0)
	}
}

struct DepthModifier: ViewModifier {
	private let depth: UI.Depth

	init(depth: UI.Depth) {
		self.depth = depth
	}

	func body(content: Content) -> some View {
		switch depth {
			case .noDepth:
				return content.shadow(color: .clear, radius: 0)
			case .level1:
				return content.shadow(color: Color(UIColor.label).opacity(0.15), radius: 8, x: 0, y: 2)
			case .level2:
				return content.shadow(color: Color(UIColor.label).opacity(0.10), radius: 16, x: 0, y: 4)
			case .level3:
				return content.shadow(color: Color(UIColor.label).opacity(0.10), radius: 24, x: 0, y: 8)
			case .level4:
				return content.shadow(color: Color(UIColor.label).opacity(0.20), radius: 32, x: 0, y: 12)
			case let .manual(c, r, x, y):
				return content.shadow(color: c, radius: r, x: x, y: y)
		}
	}
}

public extension View {
	func depth(_ depth: UI.Depth) -> some View {
		self.modifier(DepthModifier(depth: depth))
	}
}
