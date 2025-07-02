//
//  CarrouselModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

public struct CarrouselModel {
	let image: Image?
	let imageHeight: CGFloat
	let title: String?
	let description: String?

	public init(
		image: Image? = nil,
		imageHeight: CGFloat = 300,
		title: String? = nil,
		description: String? = nil,
	) {
		self.image = image
		self.imageHeight = imageHeight
		self.title = title
		self.description = description
	}
}
