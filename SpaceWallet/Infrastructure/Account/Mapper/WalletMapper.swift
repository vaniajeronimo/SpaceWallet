//
//  WalletMapper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Foundation

extension WalletModel {

	init(_ model: WalletModelResponse) {
		self.id = model.id
		self.name = model.name
		self.color = model.color
	}

	init(_ model: WalletEntity) {
		self.id = model.id
		self.name = model.name
		self.color = model.color
	}
}

extension WalletEntity {

	init(_ model: WalletModel) {
		self.id = model.id
		self.name = model.name
		self.color = model.color
	}

	init(_ model: WalletSwiftDataEntity) {
		self.id = model.id
		self.name = model.name
		self.color = model.color
	}
}

extension WalletSwiftDataEntity {

	convenience init(_ model: WalletEntity) {
		self.init(id: model.id, name: model.name, color: model.color)
	}

	func toModel() -> WalletModel {
		return WalletModel(
			id: id,
			name: name,
			color: color
		)
	}
}
