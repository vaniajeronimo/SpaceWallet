//
//  Tab.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

public struct Tab: Identifiable {

	public var content: any View
	public var tag: TabBarItem
	public var id = UUID()
}
