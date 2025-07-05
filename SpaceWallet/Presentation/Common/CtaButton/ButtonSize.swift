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
			case .medium, .large: return .heading4SemiBold
			case .small: return .heading5SemiBold
		}
	}

	var radius: CGFloat {
		switch self {
			case .medium, .large: return 12
			case .small: return 8
		}
	}

	var padding: CGFloat {
		switch self {
			case .medium: return 14
			case .large: return 16
			case .small: return 10
		}
	}

	var width: CGFloat {
		switch self {
			case .medium: return 303
			case .large: return 343
			case .small: return 200
		}
	}

	var height: CGFloat {
		switch self {
			case .medium: return 48
			case .large: return 53
			case .small: return 44
		}
	}
}
