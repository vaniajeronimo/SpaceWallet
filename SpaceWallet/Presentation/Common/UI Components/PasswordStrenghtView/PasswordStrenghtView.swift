//
//  PasswordStrenghtView.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

public struct PasswordStrengthView: View {
	let stepperColors: [Color]
	let hintText: String
	let isStrong: Bool

	public init(stepperColors: [Color], hintText: String, isStrong: Bool) {
		self.stepperColors = stepperColors
		self.hintText = hintText
		self.isStrong = isStrong
	}

	public var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(alignment: .center, spacing: 12) {
				ForEach(stepperColors.indices, id: \.self) { index in
					RoundedRectangle(cornerRadius: UI.Corner.xxs)
						.fill(stepperColors[index])
						.frame(width: 93, height: 5.64)
				}
			}

			HStack {
				if stepperColors.first != .grayQuaternary {
					Text(hintText)
						.foregroundStyle(stepperColors.first ?? .grayQuaternary)
				}

				Spacer()

				if isStrong {
					Text("password_hint".localized)
						.foregroundStyle(.textTertiary)
				}
			}
			.font(.footnote)
			.fontWeight(.medium)
		}
	}
}
