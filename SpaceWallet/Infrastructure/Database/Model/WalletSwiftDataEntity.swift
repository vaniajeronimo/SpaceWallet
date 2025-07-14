//
//  WalletSwiftDataEntity.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Foundation
import SwiftData

@Model
class WalletSwiftDataEntity {
	var id: UUID
	var name: String
	var color: String

	init(id: UUID = UUID(), name: String, color: String) {
		self.id = id
		self.name = name
		self.color = color
	}
}
