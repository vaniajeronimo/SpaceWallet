//
//  CarrouselPage.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct CarrouselPage: View {

	private let model: CarrouselModel

	var titleStyle = Style(font: .heading2Bold, color: .black)
	var descriptionStyle = Style(font: .heading2, color: .black)
	var imageSize = ImageSize(width: .infinity, height: 300)

	public init(model: CarrouselModel) {
		self.model = model
	}

	public var body: some View {
		VStack(alignment: .center, spacing: 12) {
			imageView
			textView
		}
	}

	@ViewBuilder
	private var imageView: some View {
		if let image = model.image {
			image
				.resizable()
				.frame(maxWidth: imageSize.width, maxHeight: model.imageHeight)
		}
	}

	private var textView: some View {
		VStack(spacing: 4) {
			if let title = model.title {
				Text(title)
					.fontStyle(titleStyle.font)
					.foregroundStyle(titleStyle.color)
			}
			if let description = model.description {
				Text(description)
					.fontStyle(descriptionStyle.font)
					.foregroundStyle(descriptionStyle.color)
			}
		}
		.padding(.horizontal, 47)
		.multilineTextAlignment(.center)
	}
}

public extension CarrouselPage {

	struct Style {
		let font: Font.Style
		let color: Color

		public init(font: Font.Style, color: Color = .black) {
			self.font = font
			self.color = color
		}
	}

	struct ImageSize {
		let width: CGFloat
		let height: CGFloat

		public init(width: CGFloat, height: CGFloat) {
			self.width = width
			self.height = height
		}
	}
}

// MARK: - Modifiers
public extension CarrouselPage {

	func titleStyle(_ style: Style) -> Self {
		var clone = self
		clone.titleStyle = style
		return clone
	}

	func descriptionStyle(_ style: Style) -> Self {
		var clone = self
		clone.descriptionStyle = style
		return clone
	}

	func imageSize(_ size: ImageSize) -> Self {
		var clone = self
		clone.imageSize = size
		return clone
	}
}
