//
//  CurrencyMapper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import Foundation

extension CurrencyModel {

	init(_ response: CurrencyModelResponse) {
		self = CurrencyModel(rawValue: response.rawValue) ?? .eur
	}

	init(_ swiftDataEntity: CurrencySwiftDataEntity) {
		switch swiftDataEntity.rawValue {
			case "€":
				self = .eur
			case "$":
				self = .usd
			case "£":
				self = .gbp
			case "¥":
				self = .jpy
			default:
				self = .eur
		}
	}

	init(_ entity: CurrencyEntity) {
		switch entity {
			case .eur:
				self = .eur
			case .usd:
				self = .usd
			case .gbp:
				self = .gbp
			case .jpy:
				self = .jpy
		}
	}

	func toEntity() -> CurrencyEntity {
		switch self {
			case .eur:
				return .eur
			case .usd:
				return .usd
			case .gbp:
				return .gbp
			case .jpy:
				return .jpy
		}
	}

	func toModel() -> CurrencyModel {
		return self
	}
}

extension CurrencyEntity {
	init(_ model: CurrencyModel) {
		switch model {
			case .eur:
				self = .eur
			case .usd:
				self = .usd
			case .gbp:
				self = .gbp
			case .jpy:
				self = .jpy
		}
	}

	func toModel() -> CurrencyModel {
		return CurrencyModel(self)
	}
}

extension CurrencySwiftDataEntity {

	convenience init(_ model: CurrencyModel) {
		let currencyType = CurrencyType(rawValue: model.symbol) ?? .eur
		self.init(currency: currencyType)
	}

	func toModel() -> CurrencyModel {
		switch self.currency {
			case .eur: return .eur
			case .usd: return .usd
			case .gbp: return .gbp
			case .jpy: return .jpy
		}
	}
}
