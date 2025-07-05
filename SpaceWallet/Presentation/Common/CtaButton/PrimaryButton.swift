//
//  CtaButton.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

public struct PrimaryButton: ButtonStyle {

	@Environment(\.isEnabled)
	private var isEnabled

	private let size: ButtonSize
	private let mode: ButtonSizeMode
	private var backgroundColor: Color
	private var pressedColor: Color?
	private var titleColor: Color

	public init(
		_ size: ButtonSize,
		mode: ButtonSizeMode = .fill,
		color backgroundColor: Color? = nil,
		titleColor: Color = .white
	) {
		self.size = size
		self.mode = mode
		self.titleColor = titleColor

		if let backgroundColor {
			self.backgroundColor = backgroundColor
		} else {
			self.backgroundColor = .violet_hover
			self.pressedColor = .violet_hover.opacity(0.3)
		}
	}

	public func makeBody(configuration: Configuration) -> some View {
		configuration
			.label
			.foregroundStyle(titleColor)
			.font(size.font)
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(background(configuration.isPressed))
			.cornerRadius(size.radius)
			.frame(width: size.width, height: size.height)
	}

	private func background(_ isPressed: Bool) -> some View {
		if isEnabled {
			if isPressed {
				if let pressedColor {
					return pressedColor.eraseToAnyView()
				}
				return backgroundColor.brightness(-0.08).eraseToAnyView()
			}
			return backgroundColor.eraseToAnyView()
		}
		return Color.violetHover.opacity(0.7).eraseToAnyView()
	}
}
