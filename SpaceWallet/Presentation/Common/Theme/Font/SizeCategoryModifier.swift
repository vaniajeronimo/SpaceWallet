//
//  SizeCategoryModifier.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

public extension View {
	/// Sets the Dynamic Type size within the view to the given value.
	/// (Polyfill for previous versions)
	///
	/// - SeeAlso: [`dynamicTypeSize(_:)`](https://developer.apple.com/documentation/swiftui/view/dynamictypesize%28_%3A%29-1m2tf)
	@available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "dynamicTypeSize(_:)")

	func sizeCategory(_ size: ContentSizeCategory) -> some View {
		environment(\.sizeCategory, size)
	}

	/// Limits the Dynamic Type size within the view to the given range.
	/// (Polyfill for previous versions)
	///
	/// - SeeAlso: [`dynamicTypeSize(_:)`](https://developer.apple.com/documentation/swiftui/view/dynamictypesize%28_%3A%29-26aj0)
	@available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "dynamicTypeSize(_:)")
	func sizeCategory<T: RangeExpression>(_ range: T) -> some View where T.Bound == ContentSizeCategory {
		modifier(SizeCategoryModifier(range: range))
	}

	func setSizeCategory() -> some View {
		self.sizeCategory(.large ... .extraExtraLarge)
	}
}

private struct SizeCategoryModifier: ViewModifier {
	@Environment(\.sizeCategory) private var sizeCategory

	private let range: ClosedRange<ContentSizeCategory>

	init<T: RangeExpression>(range: T) where T.Bound == ContentSizeCategory {
		self.range = range as? ClosedRange ?? {
			// Convert the range to ClosedRange
			let allCases = ContentSizeCategory.allCases.sorted()
			let lowerBound = allCases.first(where: range.contains(_:)) ?? .large
			let upperBound = allCases.last(where: range.contains(_:)) ?? .extraExtraLarge
			return lowerBound...upperBound
		}()
	}

	func body(content: Content) -> some View {
		content
			.environment(\.sizeCategory, min(max(range.lowerBound, sizeCategory), range.upperBound))
	}
}

extension ContentSizeCategory: @retroactive Comparable { }
