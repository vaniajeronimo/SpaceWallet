//
//  AvatarModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/08/2025.
//

import SwiftUI

public struct AvatarModel: Hashable, Identifiable {
	public var id: Int
	public var iconName: String
	public var name: String
	public var transactions: String

	public var icon: Image {
		Image(iconName)
	}
}
