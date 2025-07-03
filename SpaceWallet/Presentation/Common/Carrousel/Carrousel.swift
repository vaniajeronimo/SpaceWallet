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

	var style = Style()
	var imageSize = ImageSize()

	public init(data: [CarrouselModel]) {
		self.data = data
	}

	public var body: some View {
		VStack(alignment: .center, spacing: 12) {
			walkthroughPage
			pageControl
			Spacer()
		}
	}

	private var walkthroughPage: some View {
		VStack {
			TabView(selection: $currentIndex) {
				ForEach(0..<data.count, id: \.self) { index in
					if let model = data[safe: index] {
						CarrouselPage(model: model)
							.imageSize(imageSize.size)
							.titleStyle(style.title)
							.descriptionStyle(style.description)
							.tag(index)
					}
				}
			}
			.tabViewStyle(.page(indexDisplayMode: .never))
		}
	}

	private var pageControl: some View {
		PageControl(
			index: $currentIndex,
			size: data.count,
			selectedColor: style.selectedColor,
			deselectedColor: style.deselectedColor
		)
		.padding(.bottom, 20)
	}
}

public extension Carrousel {

	struct Style {
		let title: CarrouselPage.Style
		let description: CarrouselPage.Style

		let selectedColor: Color
		let deselectedColor: Color

		public init(
			title: CarrouselPage.Style = .init(font: .heading2Bold, foreground: .blue),
			description: CarrouselPage.Style = .init(font: .heading2, foreground: .black),
			selectedColor: Color = .violet,
			deselectedColor: Color = .gray300
		) {
			self.title = title
			self.description = description
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
