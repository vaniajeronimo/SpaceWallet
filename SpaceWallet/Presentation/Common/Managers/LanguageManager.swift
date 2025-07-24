//
//  LanguageManager.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 24/07/2025.
//

import Foundation
import SwiftUI

class LanguageManager: ObservableObject {

	static let shared = LanguageManager()

	@Published var currentLanguage: String {
		didSet {
			UserDefaults.standard.set(currentLanguage, forKey: "SelectedLanguage")
		}
	}

	var bundle: Bundle {
		guard let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"),
			  let bundle = Bundle(path: path) else {
			return Bundle.main
		}
		return bundle
	}

	private init() {
		self.currentLanguage = UserDefaults.standard.string(forKey: "SelectedLanguage") ?? "en"
	}
}
