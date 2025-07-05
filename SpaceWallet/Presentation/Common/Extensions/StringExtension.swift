//
//  StringExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import Foundation

public extension String {

	var localized: String {
		NSLocalizedString(self, bundle: Bundle.main, comment: "")
	}

	func localized(with arguments: CVarArg...) -> String {
		let localizedString = NSLocalizedString(self, bundle: Bundle.main, comment: "")
		return String(format: localizedString, arguments: arguments)
	}
}
