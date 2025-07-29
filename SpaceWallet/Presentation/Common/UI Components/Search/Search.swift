//
//  Search.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

public struct Search: View {

	@Environment(\.isEnabled)
	var isEnabled: Bool

	private let placeholder: String
	private var emptyStateTitle: String?
	private var emptyStateMessage: String?

	private var leftIcon: Image? = Image.search

	@Binding private var searchString: String
	@Binding private var disabled: Bool
	@Binding private var isShowingEmptyState: Bool

	@State private var isEditing: Bool = false

	private var style: Style = .init()
	private let onDidFinishSearch: (_ search: String) -> Void
	private var onLeftIconAction: (() -> Void)?

	public init(
		placeholder: String = "",
		emptyStateTitle: String = "",
		emptyStateMessage: String = "",
		searchString: Binding<String> = .constant(""),
		isShowingEmptyState: Binding<Bool> = .constant(false),
		onDidFinishSearch: @escaping (String) -> Void = { _ in }
	) {
		self.placeholder = placeholder
		self.emptyStateTitle = emptyStateTitle
		self.emptyStateMessage = emptyStateMessage
		self._searchString = searchString
		self._disabled = .variable(false)
		self._isShowingEmptyState = isShowingEmptyState
		self.onDidFinishSearch = onDidFinishSearch
	}

	public var body: some View {
		VStack {
			TextField(placeholder, text: $searchString) { editing in
				withAnimation { isEditing = editing }
				if !isEditing {
					onDidFinishSearch(searchString)
				}
			}
			.font(style.size.fontStyle)
			.padding(24)
			.padding(.leading, leftIcon != nil ? 26 : 0)
			.padding(.trailing, 18)
			.frame(maxHeight: style.size.height)
			.foregroundStyle(isEnabled ? style.state.textColor : Color.grayTertiary)
			.accentColor(style.state.accentColor)
			.background(
				ZStack {
					RoundedRectangle(cornerRadius: UI.Corner.m)
						.fill(style.state.backgroundColor)
						.depth(style.state.depth)
					RoundedRectangle(cornerRadius: UI.Corner.m)
						.stroke(strokeColor, lineWidth: isEditing ? style.state.focusedStrokeWidth : style.state.strokeWidth)
				}
			)
			.overlay(
				HStack {
					if let icon = leftIcon {
						if let action = onLeftIconAction {
							Button(action: {
								action()
							}, label: {
								buildLeftIcon(icon: icon)
							})
						} else {
							buildLeftIcon(icon: icon)
						}
					}
					Spacer()
					if searchString.isNotEmpty {
						Button {
							searchString = ""
						} label: {
							Image.close_icon
								.frame(width: 16, height: 16)
						}
					}
				}
				.padding(.horizontal)
			)
			if searchString.hasPrefix(" ") {
				/*
				 EmptyStateView(title: emptyStateTitle, message: emptyStateMessage)
					.onAppear {
						isShowingEmptyState = true
					}
					.onDisappear {
						isShowingEmptyState = false
					}
				 */
			}
		}
		.padding(.horizontal, 20)
	}
}

// MARK: Internal
private extension Search {

	var strokeColor: Color {
		if isEnabled {
			if isEditing {
				return style.state.focusedStrokeColor
			}
			return style.state.strokeColor
		}
		return style.state.disabledStrokeColor
	}

	func buildLeftIcon(icon: Image) -> some View {
		icon
			.renderingMode(.template)
			.foregroundStyle(style.state.iconColor)
			.frame(width: style.size.iconSize.width, height: style.size.iconSize.height)
	}
}

// MARK: Modifiers
public extension Search {

	func style(_ style: Style) -> Self {
		var clone = self
		clone.style = style
		return clone
	}

	func leftIcon(_ icon: Image?, action: (() -> Void)? = nil) -> Self {
		var clone = self
		clone.leftIcon = icon
		clone.onLeftIconAction = action
		return clone
	}
}
