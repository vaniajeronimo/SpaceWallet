//
//  ProfitLabel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public struct ProfitLabel: View {

	let balanceModel: BalanceModel
	var source: Source

	var showsPlusMinus: Bool
	var showsCurrencySymbol: Bool
	var showsPercentage: Bool
	var showsBackground: Bool

	private var value: Double {
		switch source {
			case .profit: return balanceModel.profit ?? 0
			case .margin: return balanceModel.margin ?? 0
			case .balance: return balanceModel.balance
		}
	}

	private var currencySymbol: String? {
		balanceModel.currency.symbol
	}

	public init(
		balanceModel: BalanceModel,
		source: Source = .balance,
		showsPlusMinus: Bool = false,
		showsCurrencySymbol: Bool = false,
		showsPercentage: Bool = false,
		showsBackground: Bool = true
	) {
		self.balanceModel = balanceModel
		self.source = source
		self.showsPlusMinus = showsPlusMinus
		self.showsCurrencySymbol = showsCurrencySymbol
		self.showsPercentage = showsPercentage
		self.showsBackground = showsBackground
	}

	public var body: some View {
		let formattedValue = formatValue()
		let backgroundColor = background(for: value)
		let textColor = textColor(for: value)
		let font = fontStyle()

		Text(formattedValue)
			.font(font)
			.fontWeight(.semibold)
			.foregroundStyle(textColor)
			.padding(UI.Spacing.level02)
			.if(showsBackground) { view in
				view.background(
					RoundedRectangle(cornerRadius: UI.Corner.s)
						.fill(backgroundColor)
				)
			}
	}

	private func formatValue() -> String {
		let sign: String = {
			if value == 0 { return showsPlusMinus ? "+" : "" }
			if value > 0 { return showsPlusMinus ? "+" : "" }
			return showsPlusMinus ? "−" : ""
		}()

		let absValue = abs(value)
		let formatted = String(format: "%.2f", absValue)

		var result = "\(sign)"
		if showsCurrencySymbol {
			result += currencySymbol ?? ""
		}
		result += formatted

		if showsPercentage {
			result += "%"
		}
		return result
	}

	private func background(for value: Double) -> Color {
		switch value {
			case 0: return .violetHover
			case let v where v > 0: return .greenActive
			default: return .redActive
		}
	}

	private func textColor(for value: Double) -> Color {
		guard source != .balance else { return .textPrimary }

		switch value {
			case 0: return showsBackground ? .b0 : .violetHover
			case let v where v > 0: return showsBackground ? .b0 : .greenActive
			default: return showsBackground ? .b0 : .redActive
		}
	}

	private func fontStyle() -> Font {
		source == .balance ? .displayBigBold : (showsBackground ? .caption : .heading5)
	}
}

// MARK: - Modifiers
public extension ProfitLabel {

	enum Source {
		case profit
		case margin
		case balance
	}

	func source(_ source: Source) -> Self {
		var result = self
		result.source = source
		return result
	}

	func showsPlusMinus(_ value: Bool) -> Self {
		var result = self
		result.showsPlusMinus = value
		return result
	}

	func showsCurrencySymbol(_ value: Bool) -> Self {
		var result = self
		result.showsCurrencySymbol = value
		return result
	}

	func showsPercentage(_ value: Bool) -> Self {
		var result = self
		result.showsPercentage = value
		return result
	}

	func showsBackground(_ value: Bool) -> Self {
		var result = self
		result.showsBackground = value
		return result
	}
}
