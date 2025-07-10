//
//  StringExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import Foundation

public extension String {

	var isNotEmpty: Bool {
		!self.isEmpty
	}

	var localized: String {
		NSLocalizedString(self, bundle: Bundle.main, comment: "")
	}

	func localized(with arguments: CVarArg...) -> String {
		let localizedString = NSLocalizedString(self, bundle: Bundle.main, comment: "")
		return String(format: localizedString, arguments: arguments)
	}

	/** Returns a masked string */
	func mask(with format: String) -> String {
		guard !format.isEmpty else { return self }

		let string = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
		var index = string.startIndex
		var maskedText = ""

		for char in format {
			if index == string.endIndex {
				break
			}

			switch char {
				case "#":
					maskedText.append(string[index])
					index = string.index(after: index)
				case "X":
					maskedText.append("X")
					index = string.index(after: index)
				default:
					maskedText.append(char)
			}
		}

		return maskedText
	}

	/** Returns a bool indicating whether the string matches the regex */
	func isMatch(with pattern: String) -> Bool {
		let range = NSRange(location: 0, length: self.utf16.count)

		guard let regex = try? NSRegularExpression(pattern: pattern) else {
			return false
		}

		if regex.firstMatch(in: self, options: [], range: range) != nil {
			return true
		}

		return false
	}

	var removeWhiteSpaces: String {
		return self.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
	}
}
