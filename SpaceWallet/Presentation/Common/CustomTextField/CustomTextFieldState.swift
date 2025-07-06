//
//  CustomTextFieldState.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import Foundation
import SwiftUI

public enum CustomTextFieldState: Equatable {

	case `default`
	case disabled
	case confirmed
	case error(String)

	var textColor: Color {
		switch self {
			case .disabled:
				return .gray300
			default:
				return .textPrimary
		}
	}

	var placeholderColor: Color {
		switch self {
			case .disabled:
				return .gray300
			case .error:
				return .redDefault
			default:
				return .gray300
		}
	}

	var helperTextColor: Color {
		switch self {
			case .disabled:
				return .gray300
			case .error:
				return .redDefault
			default:
				return .gray300
		}
	}

	func strokeColor(hasFocus: Bool = false) -> Color {
		switch self {
			case .disabled:
				return .fillPrimary
			case .error:
				return .redDefault
			default:
				return .fillPrimary
		}
	}

	var hasNoError: Bool {
		switch self {
			case .error:
				return false
			default:
				return true
		}
	}

	var backgroundColor: Color {
		switch self {
			case .confirmed:
				return .fillQuaternary
			case .error:
				return .fillTransparentRed
			default:
				return .b0
		}
	}
}
