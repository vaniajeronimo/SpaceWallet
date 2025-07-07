//
//  ImageCarrousel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct Carrousel: View {

	@State private var currentIndex = 0

	private let data: [CarrouselModel]
	private let onNewIndex: (Int) -> Void

	var style = Style()
	var imageSize = ImageSize()

	public init(data: [CarrouselModel], onNewIndex: @escaping (Int) -> Void) {
		self.data = data
		self.onNewIndex = onNewIndex
	}

	public var body: some View {
		VStack {
			carrousel
			pageControl
		}
	}

	private var carrousel: some View {
		TabView(selection: $currentIndex) {
			ForEach(0..<data.count, id: \.self) { index in
				if let model = data[safe: index] {
					CarrouselPage(model: model)
						.imageSize(imageSize.size)
						.tag(index)
				}
			}
		}
		.onChange(of: currentIndex) { _, newValue in
			onNewIndex(newValue)
		}
		.frame(maxWidth: .infinity, maxHeight: 80)
		.tabViewStyle(.page(indexDisplayMode: .never))
	}

	private var pageControl: some View {
		PageControl(
			index: $currentIndex,
			size: data.count,
			selectedColor: style.selectedColor,
			deselectedColor: style.deselectedColor
		)
	}
}

public extension Carrousel {

	struct Style {
		let selectedColor: Color
		let deselectedColor: Color

		public init(
			selectedColor: Color = .violet,
			deselectedColor: Color = .gray400
		) {
			self.selectedColor = selectedColor
			self.deselectedColor = deselectedColor
		}
	}

	struct ImageSize {
		let size: CarrouselPage.ImageSize

		public init(size: CarrouselPage.ImageSize = .init(width: .infinity, height: 300)) {
			self.size = size
		}
	}
}
