//
//  CarrouselPage.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct CarrouselPage: View {

	private let model: CarrouselModel
	var imageSize = ImageSize(width: .infinity, height: 300)

	public init(model: CarrouselModel) {
		self.model = model
	}

	public var body: some View {
		VStack(alignment: .center) {
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
					.font(.heading2Bold)
					.foregroundStyle(.textPrimary)
			}
			if let description = model.description {
				Text(description)
					.font(.heading2)
					.foregroundStyle(.textPrimary)
			}
		}
		.padding(.horizontal, 47)
		.multilineTextAlignment(.center)
	}
}

public extension CarrouselPage {

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

	func imageSize(_ size: ImageSize) -> Self {
		var clone = self
		clone.imageSize = size
		return clone
	}
}
