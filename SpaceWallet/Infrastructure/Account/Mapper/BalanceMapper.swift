//
//  BalanceMapper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import Foundation

extension BalanceModel {

	init(_ entity: BalanceEntity) {
		self.balance = entity.balance
		self.currency = CurrencyModel(entity.currency)
		self.margin = entity.margin
		self.profit = entity.profit
	}

	init(_ response: BalanceModelResponse) {
		self.balance = response.balance
		self.currency = CurrencyModel(response.currency)
		self.margin = response.margin
		self.profit = response.profit
	}

	init(_ swiftDataEntity: BalanceSwiftDataEntity) {
		self.balance = swiftDataEntity.balance
		self.currency = swiftDataEntity.currency.toModel()
		self.margin = swiftDataEntity.margin
		self.profit = swiftDataEntity.profit
	}

	func toEntity() -> BalanceEntity {
		return BalanceEntity(
			balance: balance,
			currency: currency.toEntity(),
			margin: margin,
			profit: profit
		)
	}
}

extension BalanceEntity {

	init(_ model: BalanceModel) {
		self.balance = model.balance
		self.currency = model.currency.toEntity()
		self.margin = model.margin
		self.profit = model.profit
	}

	init(_ swiftDataEntity: BalanceSwiftDataEntity) {
		self.balance = swiftDataEntity.balance
		self.currency = swiftDataEntity.currency.toModel().toEntity()
		self.margin = swiftDataEntity.margin
		self.profit = swiftDataEntity.profit
	}

	func toModel() -> BalanceModel {
		return BalanceModel(self)
	}
}

extension BalanceSwiftDataEntity {

	convenience init(_ entity: BalanceEntity) {
		self.init(
			balance: entity.balance,
			currency: CurrencySwiftDataEntity(entity.currency.toModel()),
			margin: entity.margin,
			profit: entity.profit
		)
	}

	func toModel() -> BalanceModel {
		return BalanceModel(self)
	}
}
