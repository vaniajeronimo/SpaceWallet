//
//  BalanceStatus.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public enum BalanceStatusModel: String, Codable {
	case profit
	case breakEven
	case loss

	public static func from(value: Double) -> Self {
		if value > 0 {
			return .profit
		}
		if value < 0 {
			return .loss
		}
		return .breakEven
	}

	var backgroundColor: Color {
		switch self {
			case .profit:
				return .greenActive
			case .loss:
				return .redActive
			case .breakEven:
				return .textTertiary
		}
	}

	var textColor: Color {
		return .b0
	}
}
