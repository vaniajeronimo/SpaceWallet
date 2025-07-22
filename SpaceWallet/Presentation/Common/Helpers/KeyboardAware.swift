//
//  KeyboardExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 08/07/2025.
//

import Foundation
import SwiftUI

private struct KeyboardAware: ViewModifier {

	let offset: CGFloat
	@ObservedObject private var keyboard = KeyboardInfo.shared

	func body(content: Content) -> some View {
		content
			.padding(.bottom, keyboard.height > 0 ? keyboard.height - offset : 0)
			.animation(.smooth(duration: 0.3), value: keyboard.height)
			.edgesIgnoringSafeArea(keyboard.height > 0 ? .bottom : [])
	}
}
public class KeyboardInfo: ObservableObject {

	static let shared = KeyboardInfo()
	@Published var height: CGFloat = 0

	private init() {
		let center = NotificationCenter.default
		center.addObserver(self, selector: #selector(keyboardChanged), name: UIApplication.keyboardWillShowNotification, object: nil)
		center.addObserver(self, selector: #selector(keyboardChanged), name: UIApplication.keyboardWillHideNotification, object: nil)
		center.addObserver(self, selector: #selector(keyboardChanged), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
	}

	@objc private func keyboardChanged(notification: Notification) {
		guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

		executeInMainThread {
			withAnimation(.smooth(duration: 0.3)) {
				self.height = notification.name == UIApplication.keyboardWillHideNotification ? 0 : frame.height
			}
		}
	}
}

extension View {
	public func keyboardAware(offset: CGFloat = 120) -> some View {
		modifier(KeyboardAware(offset: offset))
	}
}
