//
//  Search+Style.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

extension Search {

	public enum StyleState {

		case withoutStroke, withShadow, withStroke

		case custom(
			backgroundColor: Color = Color.gray300,
			textColor: Color = .text3,
			iconColor: Color = .text3,
			accentColor: Color = .text3,
			strokeColor: Color = .clear,
			strokeWidth: CGFloat = 1.0,
			depth: UI.Depth = .noDepth,
			focusedStrokeColor: Color = .clear,
			focusedStrokeWidth: CGFloat = 1.0,
			disabledBackgroundColor: Color = .gray300,
			disabledStrokeColor: Color = .clear
		)

		var backgroundColor: Color {
			switch self {
				case .custom(let backgroundColor, _, _, _, _, _, _, _, _, _, _):
					return backgroundColor
				default: return .fillTertiary
			}
		}

		var textColor: Color {
			switch self {
				case .custom(_, let textColor, _, _, _, _, _, _, _, _, _):
					return textColor
				default: return Color.text3
			}
		}

		var iconColor: Color {
			switch self {
				case .custom(_, _, let iconColor, _, _, _, _, _, _, _, _):
					return iconColor
				default: return Color.gray300
			}
		}

		var accentColor: Color {
			switch self {
				case .custom(_, _, _, let accentColor, _, _, _, _, _, _, _):
					return accentColor
				default: return Color.text3
			}
		}

		var strokeColor: Color {
			switch self {
				case .custom(_, _, _, _, let strokeColor, _, _, _, _, _, _):
					return strokeColor
				case .withStroke:
					return Color.fillSecondary
				default: return .clear
			}
		}

		var strokeWidth: CGFloat {
			switch self {
				case .custom(_, _, _, _, _, let strokeWidth, _, _, _, _, _):
					return strokeWidth
				case .withStroke:
					return 1.0
				default: return 0
			}
		}

		var depth: UI.Depth {
			switch self {
				case .custom(_, _, _, _, _, _, let depth, _, _, _, _):
					return depth
				case .withShadow:
					return .level3
				default: return .noDepth
			}
		}

		var focusedStrokeColor: Color {
			switch self {
				case .custom(_, _, _, _, _, _, _, let focusedStrokeColor, _, _, _):
					return focusedStrokeColor
				default: return Color.gray300
			}
		}

		var focusedStrokeWidth: CGFloat {
			switch self {
				case .custom(_, _, _, _, _, _, _, _, let focusedStrokeWidth, _, _):
					return focusedStrokeWidth
				default: return 1.5
			}
		}

		var disabledBackgroundColor: Color {
			switch self {
				case .custom(_, _, _, _, _, _, _, _, _, let disabledBackgroundColor, _):
					return disabledBackgroundColor
				case .withStroke:
					return .fillTertiary
				default: return Color.grayTertiary
			}
		}

		var disabledStrokeColor: Color {
			switch self {
				case .custom(_, _, _, _, _, _, _, _, _, _, let disabledStrokeColor):
					return disabledStrokeColor
				default: return Color.fillSecondary
			}
		}
	}

	public struct Style {

		private(set) var size: Size
		private(set) var state: StyleState

		public init(size: Size = .m, state: StyleState = .withStroke) {
			self.size = size
			self.state = state
		}
	}
}
