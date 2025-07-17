//
//  ButtonSize.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

public enum ButtonSize {
	case medium
	case large
	case small

	var font: Font {
		switch self {
			case .small, .medium, .large:
				return .heading4.weight(.medium)
		}
	}

	var radius: CGFloat {
		switch self {
			case .medium, .large, .small: return 12
		}
	}

	var padding: CGFloat {
		switch self {
			case .medium, .large: return 16
			case .small: return 13.5
		}
	}

	var width: CGFloat {
		switch self {
			case .medium: return 303
			case .large: return .infinity
			case .small: return 237
		}
	}

	var height: CGFloat {
		switch self {
			case .medium, .large: return 53
			case .small: return 48
		}
	}
}
