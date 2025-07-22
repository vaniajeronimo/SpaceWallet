//
//  ButtonSizeMode.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

public enum ButtonSizeMode {
	case fill
	case fit
	case custom(CGFloat)

	var maxWidth: CGFloat? {
		switch self {
			case .fill: return .infinity
			case .fit: return nil
			case .custom: return nil
		}
	}

	var horizontalPadding: CGFloat? {
		switch self {
			case .fill: return nil
			case .fit: return UI.Spacing.level08
			case .custom(let padding): return padding
		}
	}
}
