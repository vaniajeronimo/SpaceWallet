//
//  CodeInputField.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 08/07/2025.
//

import SwiftUI

public struct DigitFields: View {

	@FocusState private var focusedIndex: Int?

	@State private var code: [String] = Array(repeating: "", count: 6)
	@State private var numberOfFields: Int

	private let onFieldsCompleted: () -> Void

	var allFieldsFilled: Bool {
		code.allSatisfy { $0.count == 1 }
	}

	init(
		numberOfFields: Int = 6,
		onFieldsCompleted: @escaping () -> Void = {}
	) {
		self.numberOfFields = numberOfFields
		self.onFieldsCompleted = onFieldsCompleted
	}

	public var body: some View {
		HStack(spacing: UI.Spacing.level05) {
			ForEach(0..<numberOfFields, id: \.self) { index in
				createTextField(for: index)
			}
		}
		.onAppear {
			focusedIndex = 0
		}
	}

	private func createTextField(for index: Int) -> some View {
		TextField("", text: $code[index])
			.tint(.textPrimary)
			.keyboardType(.numberPad)
			.multilineTextAlignment(.center)
			.font(.heading4)
			.frame(width: 37, height: 48)
			.background(
				RoundedRectangle(cornerRadius: UI.Corner.s)
					.stroke(.fillSecondary, lineWidth: UI.Border.m)
			)
			.focused($focusedIndex, equals: index)
			.onChange(of: code[index]) { _, newValue in
				handleNewValue(newValue, index: index)
			}
	}

	private func handleNewValue(_ newValue: String, index: Int) {
		let filtered = newValue.filter { $0.isNumber }

		if filtered != newValue {
			code[index] = filtered
		}

		if filtered.count > 1 {
			code[index] = String(filtered.prefix(1))
		}

		if filtered.isNotEmpty {
			if index < numberOfFields - 1 {
				focusedIndex = index + 1
			} else {
				if allFieldsFilled {
					onFieldsCompleted()
				}
			}
		}
	}
}
