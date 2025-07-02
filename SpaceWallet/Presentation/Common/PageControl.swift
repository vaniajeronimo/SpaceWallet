//
//  PageControl.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct PageControl: View {

	@Binding private var index: Int
	private let maxIndex: Int

	private let selectedColor: Color
	private let deselectedColor: Color

	public init(
		index: Binding<Int>,
		size: Int,
		selectedColor: Color = .violet,
		deselectedColor: Color = .gray300
	) {
		self._index = index
		self.maxIndex = size - 1
		self.selectedColor = selectedColor
		self.deselectedColor = deselectedColor
	}

	public var body: some View {
		HStack(spacing: 6) {
			ForEach(0...maxIndex, id: \.self) { idx in
				Capsule()
					.fill(index == idx ? selectedColor : deselectedColor)
					.frame(width: index == idx ? 12 : 6, height: 6)
			}
		}
		.animation(.easeInOut, value: index)
	}
}
