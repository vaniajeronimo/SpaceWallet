//
//  WalletSwiftDataEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftData

@Model
class WalletSwiftDataEntity {
	var id: Int
	var name: String
	var color: String

	init(id: Int, name: String, color: String) {
		self.id = id
		self.name = name
		self.color = color
	}
}
