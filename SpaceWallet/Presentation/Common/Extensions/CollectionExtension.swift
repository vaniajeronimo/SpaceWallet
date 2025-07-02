//
//  CollectionExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import Foundation

public extension Collection {

	func isSingleItem() -> Bool {
		return count <= 1
	}

	func onlyItem() -> Element? {
		return count == 1 ? first : nil
	}

	private func distance(from startIndex: Index) -> Int {
		return distance(from: startIndex, to: self.endIndex)
	}

	private func distance(to endIndex: Index) -> Int {
		return distance(from: self.startIndex, to: endIndex)
	}

	subscript(safe index: Index) -> Element? {
		if distance(to: index) >= 0 && distance(from: index) > 0 {
			return self[index]
		}
		return nil
	}

	subscript(safe bounds: Range<Index>) -> SubSequence? {
		if distance(to: bounds.lowerBound) >= 0 && distance(from: bounds.upperBound) >= 0 {
			return self[bounds]
		}
		return nil
	}

	subscript(safe bounds: ClosedRange<Index>) -> SubSequence? {
		if distance(to: bounds.lowerBound) >= 0 && distance(from: bounds.upperBound) > 0 {
			return self[bounds]
		}
		return nil
	}
}
