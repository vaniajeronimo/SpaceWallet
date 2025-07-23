//
//  NavigationBarButton.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 23/07/2025.
//

import SwiftUI

public struct NavigationBarButton {

	private var buttonColor: Color = .textPrimary
	private var renderingMode: Image.TemplateRenderingMode = .original

	public private(set) var barButtonItem: BarButtonItem

	public init(_ barButtonItem: BarButtonItem) {
		self.barButtonItem = barButtonItem
	}

	@ViewBuilder
	public func button() -> some View {
		switch barButtonItem {
			case .close(let action):
				Button {
					action()
				} label: {
					ZStack {
						Circle().fill(Color.fillTertiary)
						Image.close_outline
							.renderingMode(renderingMode)
							.foregroundStyle(buttonColor)
							.frame(width: 24, height: 24)
					}
					.frame(width: 40, height: 40)
				}
				.contentShape(Circle())
			case .back(let action):
				Button {
					action()
				} label: {
					ZStack {
						Circle().fill(Color.fillTertiary)
						Image.chevronLeft
							.renderingMode(renderingMode)
							.foregroundStyle(buttonColor)
							.frame(width: 24, height: 24)
					}
					.frame(width: 40, height: 40)
				}
				.contentShape(Circle())
			case .custom(let icon, let hasBackground, let action):
				Button(action: action) {
					if let icon {
						if hasBackground {
							ZStack {
								Circle().fill(Color.fillTertiary)
								icon
									.renderingMode(renderingMode)
									.foregroundStyle(buttonColor)
									.frame(width: 24, height: 24)
							}
							.frame(width: 40, height: 40)
						} else {
							icon
								.renderingMode(renderingMode)
								.foregroundStyle(buttonColor)
								.frame(width: 24, height: 24)
						}
					} else {
						EmptyView()
					}
				}
			case .customText(let text, let action):
				Button(action: {
					action()
				}, label: {
					Text(text)
						.font(.heading5SemiBold)
						.foregroundStyle(Color.textPrimary)
						.frame(height: 48)
				})
			case .customView(let content):
				AnyView(content())
		}
	}

	public func buttonColor(_ color: Color) -> Self {
		var result = self
		result.buttonColor = color
		return result
	}

	public func renderingMode(_ renderingMode: Image.TemplateRenderingMode) -> Self {
		var result = self
		result.renderingMode = renderingMode
		return result
	}
}

public extension NavigationBarButton {

	enum BarButtonItem: Equatable {

		case back(action: () -> Void)
		case close(action: () -> Void)
		case custom(icon: Image?, hasBackground: Bool = false, action: () -> Void)
		case customText(text: String, action: () -> Void)
		case customView(content: () -> any View)

		public static func == (lhs: Self, rhs: Self) -> Bool {
			switch (lhs, rhs) {
				case (.back, .back):
					return true
				case (.close, .close):
					return true
				case (.custom, .custom):
					return true
				case (.customText, .customText):
					return true
				case (.customView, .customView):
					return true
				default:
					return false
			}
		}
	}
}
