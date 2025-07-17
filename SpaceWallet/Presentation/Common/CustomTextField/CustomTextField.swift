//
//  CustomTextField.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import SwiftUI

public struct CustomTextField: View {

	@State private var isTextHidden: Bool
	@Binding private var text: String
	@FocusState private var isFocused: Bool

	private var prefixText: String = "+351"
	private var helperText: String = " "
	private var maskFormat: String = ""
	private var uppercased = false
	private var disallowSpaces = false
	private var isSecuredField: Bool = false
	private var showClearButton: Bool = false
	private var isCurrencyFied: Bool = false
	private var isPhoneNumberField: Bool = false
	private var onCommit: (() -> Void)?
	private var onChange: ((String) -> Void)?
	private var onClearAction: (() -> Void)?
	private var onIconTap: (() -> Void)?
	private var onPrefixTap: (() -> Void)?
	private let placeholder: String
	private let title: String
	private let titleIcon: Image?

	private var hasText: Bool {
		text.isNotEmpty
	}

	private var state: CustomTextFieldState = .default {
		didSet {
			if case .error(let text) = state {
				withAnimation(.smooth) {
					helperText = text
				}
			}
		}
	}

	public init(
		title: String,
		titleIcon: Image? = nil,
		placeholder: String = "",
		text: Binding<String>,
		onCommit: (() -> Void)? = nil,
		onChange: ((String) -> Void)? = nil,
		onClearAction: (() -> Void)? = nil,
		onIconTap: (() -> Void)? = nil,
		onPrefixTap: (() -> Void)? = nil
	) {
		self.title = title
		self.titleIcon = titleIcon
		self.placeholder = placeholder
		self._text = text
		self._isTextHidden = State(initialValue: isSecuredField)
		self.onCommit = onCommit
		self.onChange = onChange
		self.onClearAction = onClearAction
		self.onIconTap = onIconTap
		self.onPrefixTap = onPrefixTap
	}

	public var body: some View {
		VStack(spacing: UI.Spacing.level03) {
			ZStack(alignment: .trailing) {
				textField
				if showClearButton && hasText {
					clearButton
				}
				rightButton
			}
			.disabled((state == .disabled))

			if helperText.trimmingCharacters(in: .whitespaces).isNotEmpty {
				Text(helperText)
					.font(.footnote)
					.foregroundStyle(state.helperTextColor)
					.frame(maxWidth: .infinity, alignment: .topLeading)
					.truncationMode(.tail)
			}
		}
	}

	private var textField: some View {
		HStack(spacing: .zero) {
			if isPhoneNumberField {
				Button {
					onPrefixTap?()
				} label: {
					HStack(spacing: UI.Spacing.level02) {
						Text(prefixText)
							.font(.heading4SemiBold)
							.foregroundColor(.primary)
						Image.onboarding_arrow
							.resizable()
							.frame(width: 8, height: 4)
					}
				}
				.padding(.trailing, UI.Spacing.level04)
			}

			Group {
				if isSecuredField && isTextHidden {
					secureTextField
				} else {
					regularTextField
				}
			}
			.focused($isFocused)
			.padding(.vertical, UI.Spacing.level04)
			.padding(.trailing, UI.Spacing.level05)
		}
		.font(.heading4SemiBold)
		.foregroundStyle(state.textColor)
		.tint(state.textColor)
		.frame(height: 64)
		.padding(.init(
			top: UI.Spacing.level04,
			leading: UI.Spacing.level05,
			bottom: .zero,
			trailing: UI.Spacing.level09)
		)
		.background(background)
		.onChange(of: text, { _, txt in
			var newText = uppercased ? txt.uppercased() : txt
			if disallowSpaces {
				newText = newText.replacingOccurrences(of: " ", with: "")
			}
			if isPhoneNumberField {
				newText = newText.filter(\.isNumber)
			}
			text = newText.mask(with: maskFormat)
			onChange?(txt)
		})
	}

	private var secureTextField: some View {
		SecureField(placeholder, text: $text)
			.focused($isFocused)
	}

	private var regularTextField: some View {
		TextField(placeholder, text: $text)
			.focused($isFocused)
	}

	private var background: some View {
		ZStack(alignment: .topLeading) {
			RoundedRectangle(cornerRadius: UI.Corner.l)
				.stroke(lineWidth: UI.Border.m)
				.foregroundStyle(state.strokeColor())
				.background(
					RoundedRectangle(cornerRadius: UI.Corner.l)
						.fill(state.backgroundColor)
				)

			VStack(spacing: UI.Spacing.level01) {
				HStack(alignment: .center, spacing: UI.Spacing.level02) {
					Text(title)
						.font(.caption)
						.bold()
						.foregroundStyle(state.placeholderColor)
					if let titleIcon {
						titleIcon
							.renderingMode(.template)
							.foregroundStyle(Color.gray300)
							.onTapGesture { onIconTap?() }
					}
				}
				.padding(.top, UI.Spacing.level04)
				.padding(.leading, UI.Spacing.level05)
			}
		}
	}

	private var rightButton: some View {
		Button {
			isTextHidden.toggle()
		} label: {
			if isCurrencyFied {
				/*
				Image.euro(.size20)
					.renderingMode(.template)
					.accentColor(Color.secondaryDark100)
				*/
			}
		}
		.allowsHitTesting(isSecuredField)
		.frame(width: UI.Spacing.level06,
			   height: UI.Spacing.level06)
		.padding()
	}

	private var clearButton: some View {
		Button {
			text = ""
			onClearAction?()
		} label: {
			Image.close_icon
		}
		.frame(width: UI.Spacing.level06, height: UI.Spacing.level06)
		.padding(.trailing, 13.5)
		.padding(.top, UI.Spacing.level04)
	}
}

// MARK: - CustomTextField modifiers
public extension CustomTextField {

	func state(_ state: CustomTextFieldState) -> Self {
		var result = self
		result.state = state
		return result
	}

	func helperText(_ text: String) -> Self {
		var result = self
		result.helperText = text.isEmpty ? " " : text
		return result
	}

	func isFocused(_ isFocused: Bool) -> Self {
		let result = self
		result.isFocused = isFocused
		return result
	}

	func isPhoneNumberField(_ enabled: Bool, prefix: String = "+351") -> Self {
		var result = self
		result.isPhoneNumberField = enabled
		result.prefixText = prefix
		return result
	}

	func isSecure(_ isSecure: Bool) -> Self {
		var result = self
		result.isSecuredField = isSecure
		result._isTextHidden = .init(initialValue: isSecure)
		return result
	}

	func showClearButton(_ isToShow: Bool) -> Self {
		var result = self
		result.showClearButton = isToShow
		return result
	}

	func isCurrencyField(_ isCurrency: Bool) -> Self {
		var result = self
		result.isCurrencyFied = isCurrency
		return result
	}

	func mask(_ mask: String) -> Self {
		var result = self
		result.maskFormat = mask
		return result
	}

	func uppercased(_ isUppercased: Bool) -> Self {
		var result = self
		result.uppercased = isUppercased
		return result
	}

	func disallowSpaces(_ disallow: Bool) -> Self {
		var result = self
		result.disallowSpaces = disallow
		return result
	}
}
