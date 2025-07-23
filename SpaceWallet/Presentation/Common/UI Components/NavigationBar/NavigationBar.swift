//
//  NavigationBar.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 23/07/2025.
//

import SwiftUI

public struct NavigationBar<Content: View>: View {

	private let content: Content
	private var title: String = ""
	private var titleColor: Color = .textPrimary
	private var titleImage: Image?
	private var leftButton: NavigationBarButton?
	private var primaryRightButton: NavigationBarButton?
	private var secondaryRightButton: NavigationBarButton?
	private var backgroundView = AnyView(Color.clear)
	private var overlap: Bool = false
	private var multilineTitle: Bool = false
	private var showPrimaryRightButton: Bool = false

	private var leftButtonPadding: CGFloat {
		return UI.Spacing.level07
	}

	private var rightButtonPadding: CGFloat {
		return UI.Spacing.level07
	}

	public init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}

	public var body: some View {
		GeometryReader { _ in
			if overlap {
				ZStack(alignment: .bottom) {
					content
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				header
					.frame(height: multilineTitle ? 88 : 44)
			} else {
				VStack(spacing: .zero) {
					header
						.frame(height: multilineTitle ? 88 : 44)
					ZStack(alignment: .bottom) {
						content
					}
					.frame(maxWidth: .infinity, maxHeight: .infinity)
				}
			}
		}
	}

	private var header: some View {
		ZStack {
			backgroundView
				.ignoresSafeArea()
			Text(title)
				.font(.heading3Bold)
				.foregroundStyle(titleColor)
				.multilineTextAlignment(.center)
				.lineLimit(2)
			titleImage?
				.resizable()
				.scaledToFit()
				.frame(height: UI.Spacing.level08)
			leftButtonView
			rightButtonView
		}
	}

	private var leftButtonView: some View {
		HStack {
			leftButton?.button()
			Spacer()
		}
		.padding(.leading, leftButtonPadding)
	}

	private var rightButtonView: some View {
		HStack {
			Spacer()
			HStack(alignment: .center, spacing: UI.Spacing.level02) {
				if showPrimaryRightButton {
					primaryRightButton?.button()
				}
				secondaryRightButton?.button()
			}
		}
		.padding(.trailing, rightButtonPadding)
	}
}

public extension NavigationBar {

	func navigationTitle(_ title: String) -> Self {
		var result = self
		result.title = title
		return result
	}

	func navigationTitleColor(_ color: Color) -> Self {
		var result = self
		result.titleColor = color
		return result
	}

	func navigationTitleImage(_ image: Image) -> Self {
		var result = self
		result.titleImage = image
		return result
	}

	func navigationLeftButton(_ buttonItem: NavigationBarButton?) -> Self {
		var result = self
		result.leftButton = buttonItem
		return result
	}

	func navigationPrimaryRightButton(_ buttonItem: NavigationBarButton?, isToShow: Bool) -> Self {
		var result = self
		result.primaryRightButton = buttonItem
		result.showPrimaryRightButton = isToShow
		return result
	}

	func navigationSecondaryRightButton(_ buttonItem: NavigationBarButton?) -> Self {
		var result = self
		result.secondaryRightButton = buttonItem
		return result
	}

	func navigationBackground(_ background: some View) -> Self {
		var result = self
		result.backgroundView = AnyView(background)
		return result
	}

	func overlapNavigationBar() -> Self {
		var result = self
		result.overlap = true
		return result
	}

	func navigationTitleIsMultiline(_ bool: Bool) -> Self {
		var result = self
		result.multilineTitle = bool
		return result
	}
}
