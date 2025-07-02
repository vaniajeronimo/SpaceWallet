//
//  TabBarItem.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

public struct TabBarItem: Hashable {

	public let icon: Image?
	public let selectedIcon: Image?
	public let unselectedIcon: Image?
	public let title: String?

	public init(selectedIcon: Image? = nil, unselectedIcon: Image? = nil, title: String? = nil) {
		self.icon = nil
		self.selectedIcon = selectedIcon
		self.unselectedIcon = unselectedIcon
		self.title = title
	}

	public init(icon: Image? = nil, title: String? = nil) {
		self.icon = icon
		self.selectedIcon = nil
		self.unselectedIcon = nil
		self.title = title
	}

	public static func == (lhs: TabBarItem, rhs: TabBarItem) -> Bool {
		return lhs.title == rhs.title
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(title)
	}
}
