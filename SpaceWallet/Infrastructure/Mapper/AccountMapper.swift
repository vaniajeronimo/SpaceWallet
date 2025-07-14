//
//  AccountMapper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import Foundation

extension AccountModel {

	init(_ model: AccountModelResponse) {
		self.id = model.id
		self.userName = model.userName
		self.email = model.email
 		self.password = model.password
		self.phoneNumber = model.phoneNumber
		self.wallet = model.wallet.map { WalletModel($0) }
	}

	init(_ model: AccountEntity) {
		self.id = model.id
		self.userName = model.userName
		self.email = model.email
		self.password = model.password
		self.phoneNumber = model.phoneNumber
		self.wallet = model.wallet.map { WalletModel($0) }
	}

	func toEntity() -> AccountEntity {
		return AccountEntity(
			id: id,
			userName: userName,
			email: email,
			password: password,
			phoneNumber: phoneNumber,
			wallet: wallet.map { WalletEntity($0) }
		)
	}
}

extension AccountEntity {

	init(_ model: AccountModel) {
		self.id = model.id
		self.userName = model.userName
		self.email = model.email
		self.password = model.password
		self.phoneNumber = model.phoneNumber
		self.wallet = model.wallet.map { WalletEntity($0) }
	}

	init(_ model: AccountSwiftDataEntity) {
		self.id = model.id
		self.userName = model.userName
		self.email = model.email
		self.password = model.password
		self.phoneNumber = model.phoneNumber
		self.wallet = model.wallet.map { WalletEntity($0) }
	}
}

extension AccountSwiftDataEntity {

	convenience init(_ model: AccountEntity) {
		self.init()
		self.id = model.id
		self.userName = model.userName
		self.email = model.email
		self.password = model.password
		self.phoneNumber = model.phoneNumber
		self.wallet = model.wallet.map { WalletSwiftDataEntity($0) }
	}

	func toModel() -> AccountModel {
		return AccountModel(
			id: id,
			userName: userName,
			email: email,
			password: password,
			phoneNumber: phoneNumber,
			wallet: wallet.map { $0.toModel() }
		)
	}
}
