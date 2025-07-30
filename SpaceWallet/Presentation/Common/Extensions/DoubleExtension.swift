//
//  DoubleExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 30/07/2025.
//

import Foundation

extension Double {

	var asCurrency: String {
		self.asCurrency(symbol: "")
	}

	func asCurrency(minimumFractionDigits: Int = 2, maximumFractionDigits: Int = 2, symbol: String) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.minimumFractionDigits = minimumFractionDigits
		formatter.maximumFractionDigits = maximumFractionDigits
		formatter.decimalSeparator = "."
		formatter.groupingSeparator = "."

		if let formattedValue = formatter.string(for: self) {
			return symbol.isNotEmpty ? "\(symbol)\(formattedValue)" : formattedValue
		}
		return ""
	}

	func formattedAmount(minimumFractionDigits: Int = 2, maximumFractionDigits: Int = 8) -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.minimumFractionDigits = minimumFractionDigits
		formatter.maximumFractionDigits = maximumFractionDigits

		let languageCode = LanguageManager.shared.currentLanguage
		formatter.locale = Locale(identifier: languageCode)

		return formatter.string(for: self) ?? "\(self)"
	}

	func formattedPercentageWithSign() -> String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .percent
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = 2

		let languageCode = LanguageManager.shared.currentLanguage
		formatter.locale = Locale(identifier: languageCode)

		let percentValue = self / 100
		let formatted = formatter.string(for: abs(percentValue)) ?? "0%"

		if self > 0 {
			return "+" + formatted
		}
		if self < 0 {
			return "-" + formatted
		}
		return formatted
	}
}
