//
//  Search+Size.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

extension Search {

	public enum Size {
		case m, l

		var fontStyle: Font {
			switch self {
				case .m: return .body.weight(.medium)
				case .l: return.body.weight(.semibold)
			}
		}

		var iconSize: CGSize {
			switch self {
				case .m: return CGSize(width: 20, height: 20)
				case .l: return CGSize(width: 24, height: 24)
			}
		}

		var height: Double {
			switch self {
				case .m: return 48
				case .l: return 56
			}
		}
	}
}
