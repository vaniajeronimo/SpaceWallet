//
//  ViewExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

public extension View {

	func eraseToAnyView() -> AnyView {
		AnyView(self)
	}

	func dismissKeyboard(completion: (() -> Void)? = nil) -> some View {
		self.onTapGesture {
			hideKeyboard()
			completion?()
		}
	}

	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
										to: nil, from: nil, for: nil)
	}

	@ViewBuilder
	func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
		if condition() {
			transform(self)
		} else {
			self
		}
	}

	func tabBarItem(selectedIcon: Image? = nil, unselectedIcon: Image? = nil, title: String? = nil) -> Tab {
		Tab(content: self, tag: .init(selectedIcon: selectedIcon, unselectedIcon: unselectedIcon, title: title))
	}

	func mainTabBarItem(icon: Image? = nil, title: String? = nil) -> Tab {
		Tab(content: self, tag: .init(icon: icon, title: title))
	}
}
