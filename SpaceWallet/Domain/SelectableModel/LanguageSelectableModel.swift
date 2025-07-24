//
//  LanguageSelectableModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 24/07/2025.
//

import SwiftUI

struct LanguageSelectableModel: Equatable {

	var code: String
	var language: String
	var iconName: String
	var selectedLanguage: Language?

	init(
		code: String,
		language: String,
		iconName: String,
		selectedLanguage: Language? = nil
	) {
		self.code = code
		self.language = language
		self.iconName = iconName
		self.selectedLanguage = selectedLanguage
	}

	struct Language: SelectableItemProtocol {

		var id: Int
		var code: String
		var name: String
		var description: String { name }
		var iconName: String

		var item: Self { self }
	}
}
