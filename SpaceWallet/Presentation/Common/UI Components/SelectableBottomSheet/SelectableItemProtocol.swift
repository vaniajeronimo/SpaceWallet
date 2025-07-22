//
//  SelectableItemProtocol.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

public protocol SelectableItemProtocol: Identifiable, Equatable, Hashable {
	var id: Int { get }
	var iconName: String { get }
	var name: String { get }
	var description: String { get }
}
