//
//  ProfitLabel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public struct ProfitLabel: View {

	let value: Double
	let currencySymbol: String?
	var showsPlusMinus: Bool
	var showsCurrencySymbol: Bool
	var showsPercentage: Bool
	var showsBackground: Bool
	var source: Source

	public init(
		value: Double,
		source: Source = .profit,
		currencySymbol: String? = nil,
		showsPlusMinus: Bool = false,
		showsCurrencySymbol: Bool = false,
		showsPercentage: Bool = false,
		showsBackground: Bool = true
	) {
		self.value = value
		self.source = source
		self.currencySymbol = currencySymbol
		self.showsPlusMinus = showsPlusMinus
		self.showsCurrencySymbol = showsCurrencySymbol
		self.showsPercentage = showsPercentage
		self.showsBackground = showsBackground
	}

	init(
		balanceModel: BalanceModel,
		source: Source = .profit,
		showsPlusMinus: Bool = false,
		showsCurrencySymbol: Bool = false,
		showsPercentage: Bool = false,
		showsBackground: Bool = true
	) {
		let value: Double
		switch source {
			case .profit:
				value = balanceModel.profit ?? 0
			case .margin:
				value = balanceModel.margin ?? 0
			case .balance:
				value = balanceModel.balance
		}

		self.init(
			value: value,
			source: source,
			currencySymbol: balanceModel.currency.symbol,
			showsPlusMinus: showsPlusMinus,
			showsCurrencySymbol: showsCurrencySymbol,
			showsPercentage: showsPercentage,
			showsBackground: showsBackground
		)
	}

	public var body: some View {
		let formattedValue = formatValue()
		let backgroundColor = background(for: value)
		let textColor = textColor(for: value)

		Text(formattedValue)
			.font(showsBackground ? .caption : .heading5)
			.fontWeight(.semibold)
			.foregroundStyle(textColor)
			.padding(UI.Spacing.level02)
			.if(showsBackground) { view in
				view
					.background(
						RoundedRectangle(cornerRadius: UI.Corner.s)
							.fill(backgroundColor)
					)
			}
	}

	private func formatValue() -> String {
		let sign: String

		if value == 0 {
			sign = showsPlusMinus ? "+" : ""
		} else if value > 0 {
			sign = showsPlusMinus ? "+" : ""
		} else {
			sign = showsPlusMinus ? "−" : ""
		}

		let absValue = abs(value)
		let formattedValue = String(format: "%.2f", absValue)
		var result = "\(sign)"

		if showsCurrencySymbol {
			result += currencySymbol ?? ""
		}

		result += formattedValue

		if showsPercentage {
			result += "%"
		}

		return result
	}

	private func background(for value: Double) -> Color {
		if value == 0 {
			return .violetHover
		}
		if value > 0 {
			return .greenActive
		}
		return .redActive
	}

	private func textColor(for value: Double) -> Color {
		if value == 0 {
			return showsBackground ? .b0 : .violetHover
		}
		if value > 0 {
			return showsBackground ? .b0 : .greenActive
		}
		return showsBackground ? .b0 : .redActive
	}
}

public extension ProfitLabel {

	enum Source {
		case profit
		case margin
		case balance
	}
}

// MARK: - Modifiers
public extension ProfitLabel {

	func source(_ source: Source) -> Self {
		var result = self
		result.source = source
		return result
	}

	func showsPlusMinus(_ showsPlusMinus: Bool) -> Self {
		var result = self
		result.showsPlusMinus = showsPlusMinus
		return result
	}

	func showsCurrencySymbol(_ showsCurrencySymbol: Bool) -> Self {
		var result = self
		result.showsCurrencySymbol = showsCurrencySymbol
		return result
	}

	func showsPercentage(_ showsPercentage: Bool) -> Self {
		var result = self
		result.showsPercentage = showsPercentage
		return result
	}

	func showsBackground(_ showsBackground: Bool) -> Self {
		var result = self
		result.showsBackground = showsBackground
		return result
	}
}
