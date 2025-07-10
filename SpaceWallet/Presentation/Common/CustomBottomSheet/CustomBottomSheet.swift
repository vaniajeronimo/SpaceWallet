//
//  CustomBottomSheet.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import Foundation
import SwiftUI

public struct CustomBottomSheet<Content: View>: View {

	private let type: Dimension
	internal var configuration: Configuration = Configuration()

	@Binding private var isShowing: Bool
	@Binding private var isToShowAlert: Bool

	@GestureState var dragAmount = CGSize.zero

	@State private var offset: CGFloat = 0
	@State private var dragOffset: CGFloat = 0

	private var alertType: AlertType
	private let maxHeight: CGFloat
	private let minHeight: CGFloat
	private let content: Content
	private var onDragDown: (() -> Void)?
	private var onDismiss: (() -> Void)?
	private var onConfirm: (() -> Void)?

	public init(
		isShowing: Binding<Bool>,
		isToShowAlert: Binding<Bool> = .constant(false),
		height: CGFloat,
		alertType: AlertType = .init(),
		onDragDown: (() -> Void)? = nil,
		onDismiss: (() -> Void)? = nil,
		onConfirm: (() -> Void)? = nil,
		@ViewBuilder content: () -> Content
	) {
		self.init(
			isShowing: isShowing,
			isToShowAlert: isToShowAlert,
			alertType: alertType,
			type: .fixed(height: height),
			onDragDown: onDragDown,
			onDismiss: onDismiss,
			onConfirm: onConfirm,
			content: content
		)
	}

	public init(
		isShowing: Binding<Bool>,
		isToShowAlert: Binding<Bool> = .constant(false),
		alertType: AlertType = .init(),
		type: Dimension,
		onDragDown: (() -> Void)? = nil,
		onDismiss: (() -> Void)? = nil,
		onConfirm: (() -> Void)? = nil,
		@ViewBuilder content: () -> Content
	) {
		self._isShowing = isShowing
		self._isToShowAlert = isToShowAlert
		self.alertType = alertType
		self.content = content()
		self.type = type
		self.onDragDown = onDragDown
		self.onDismiss = onDismiss
		self.onConfirm = onConfirm

		switch type {
			case let .fixed(h):
				self.maxHeight = h
				self.minHeight = 0
			case let .expandable(min, max):
				self.minHeight = min
				self.maxHeight = max
				self._offset = .init(initialValue: max - min)
		}
	}

	public var body: some View {
		GeometryReader { geometry in
			ZStack(alignment: .bottom) {
				if isShowing {
					configuration.overlayColor
						.ignoresSafeArea()
						.frame(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height * 2)
						.position(CGPoint.zero)
						.onTapGesture {
							if configuration.dismissOnTap {
								isShowing = false
								onDragDown?()
								onDismiss?()
							}
						}
					bodyContent(geometry: geometry)
				}
			}
			.edgesIgnoringSafeArea(.bottom)
		}
	}

	private func bodyContent(geometry: GeometryProxy) -> some View {
		VStack(spacing: .zero) {
			indicator
			content
				.transaction {
					$0.disablesAnimations = true
				}
		}
		.alert(alertType.title, isPresented: $isToShowAlert) {
			Button(alertType.buttonTitle, role: .cancel) {
				onConfirm?()
			}
		} message: {
			Text(alertType.message)
		}
		.padding(.bottom, geometry.safeAreaInsets.bottom)
		.frame(
			width: geometry.size.width - 32,
			height: maxHeight,
			alignment: .top
		)
		.background(
			RoundedRectangle(cornerRadius: UI.Corner.xxl, style: .continuous)
				.fill(Color.textPrimary)
				.depth(configuration.depth)
		)
		.padding(.horizontal, 16)
		.padding(.bottom, 24 + geometry.safeAreaInsets.bottom)
		.offset(y: isShowing ? dragOffset : geometry.size.height)
		.animation(.easeInOut(duration: 0.35), value: isShowing)
		.transition(.move(edge: .bottom))
		.gesture(dragGesture)
	}

	@ViewBuilder
	private var indicator: some View {
		switch configuration.handle {
			case .notch:
				notchView
			case .close:
				closeButton
		}
	}

	private var closeButton: some View {
		HStack {
			Spacer()
			Button {
				isShowing = false
				onDismiss?()
			} label: {
				Image.close_icon
					.renderingMode(.original)
					.frame(width: UI.Spacing.level07, height: UI.Spacing.level07)
					.padding(.top, UI.Spacing.level05)
					.padding(.trailing, UI.Spacing.level05)
			}
			.padding(.top, UI.Spacing.level02)
			.padding(.trailing, UI.Spacing.level02)
		}
		.padding(.horizontal, UI.Spacing.level05)
	}

	private var notchView: some View {
		Capsule()
			.fill(.textQuaternary)
			.frame(width: 25, height: 5)
			.onTapGesture {
				isShowing.toggle()
			}
			.padding()
	}

	private var dragGesture: some Gesture {
		DragGesture()
			.onChanged { value in
				if !configuration.dismissOnDrag, case .fixed = type {
					return
				}
				dragOffset = value.translation.height
				if value.translation.height >= 0 { // dragging down
					dragOffset = min(value.translation.height, maxHeight - minHeight)
					if (offset + dragOffset) > (maxHeight - minHeight) {
						dragOffset = 0
					}
					onDragDown?()
				} else { // dragging up
					if (offset + dragOffset) <= 0 {
						offset = 0
						dragOffset = -offset
					}
				}
			}
			.onEnded { value in
				if minHeight != 0 {
					offset = value.translation.height > 0 ? (maxHeight - minHeight) : 0
				} else {
					offset = 0
				}
				dragOffset = 0

				let snapDistance = maxHeight * 0.25
				guard abs(value.translation.height) > snapDistance else {
					return
				}
				if configuration.dismissOnDrag {
					isShowing = value.translation.height < 0
				}
			}
	}

	private var placeholder: some View {
		VStack(alignment: .leading, spacing: UI.Spacing.level04) {
			VStack(alignment: .leading, spacing: UI.Spacing.level03) {
				RoundedRectangle(cornerRadius: 2)
					.fill(Color.grayTertiary)
					.frame(maxWidth: 200, maxHeight: 12)
				RoundedRectangle(cornerRadius: 2)
					.fill(Color.grayTertiary)
					.frame(maxWidth: 100, maxHeight: 10)
			}
			.padding(.horizontal, 18)

			HStack {
				RoundedRectangle(cornerRadius: 2)
					.fill(Color.grayTertiary)
					.frame(maxWidth: 150, maxHeight: 10)
				Spacer()
				Capsule()
					.fill(Color.grayTertiary)
					.frame(width: 130, height: 45)
			}
			.padding(.horizontal, 18)

			if case .expandable = type {
				VStack(alignment: .leading, spacing: UI.Spacing.level05) {
					Divider().custom()
					ForEach(0 ..< 2) { _ in
						RoundedRectangle(cornerRadius: 2)
							.fill(Color.grayTertiary)
							.frame(maxWidth: .infinity, maxHeight: 10)
							.padding(.horizontal, 18)
					}
					Divider().custom()
				}
				.padding(.vertical, 18)

				VStack(alignment: .leading, spacing: UI.Spacing.level03) {
					RoundedRectangle(cornerRadius: 2)
						.fill(Color.grayTertiary)
						.frame(maxWidth: 120, maxHeight: 12)
					RoundedRectangle(cornerRadius: 8)
						.fill(Color.grayTertiary)
						.frame(maxWidth: .infinity, maxHeight: 100)
				}
				.padding(.horizontal, 18)
			}
		}
		.padding(.bottom, 30)
	}
}

public extension CustomBottomSheet {

	struct AlertType {
		var title: String
		var message: String
		var buttonTitle: String

		public init(title: String = "", message: String = "", buttonTitle: String = "") {
			self.title = title
			self.message = message
			self.buttonTitle = buttonTitle
		}
	}
}

public extension CustomBottomSheet {

	enum Dimension {
		case fixed(height: CGFloat)
		case expandable(min: CGFloat, max: CGFloat)
	}

	enum HandleType {
		case notch
		case close
	}

	class Configuration {
		var handle: CustomBottomSheet.HandleType = .notch
		var dismissOnTap: Bool = true
		var dismissOnDrag: Bool = true
		var overlayColor: Color = .black.opacity(0.4)
		var depth: UI.Depth = .noDepth
	}
}
