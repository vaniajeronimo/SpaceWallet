//
//  Font.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

struct SFProFont {
	let name: String

	private init(named name: String) {
		self.name = name
		Font.registerFont(named: name)
	}

	static let sfBlack = Self(named: "SFPro-DisplayBlack")
	static let sfBlackItalic = Self(named: "SFPro-DisplayBlackItalic")
	static let sfBold = Self(named: "SFPro-DisplayBold")
	static let sfBoldItalic = Self(named: "SFPro-DisplayBoldItalic")
	static let sfDisplayHeavy = Self(named: "SFPro-DisplayHeavy")
	static let sfDisplayHeavyItalic = Self(named: "SFPro-DisplayHeavyItalic")
	static let sfDisplayLight = Self(named: "SFPro-DisplayLight")
	static let sfDisplayLightItalic = Self(named: "SFPro-DisplayLightItalic")
	static let sfDisplayMedium = Self(named: "SFPro-DisplayMedium")
	static let sfDisplayMediumItalic = Self(named: "SFPro-DisplayMediumItalic")
	static let sfDisplayRegular = Self(named: "SFPro-DisplayRegular")
	static let sfDisplayRegularItalic = Self(named: "SFPro-DisplayRegularItalic")
	static let sfDisplaySemiBold = Self(named: "SFPro-DisplaySemibold")
	static let sfDisplaySemiBoldItalic = Self(named: "SFPro-DisplaySemiboldItalic")
	static let sfDisplayThin = Self(named: "SFPro-DisplayThin")
	static let sfDisplayThinItalic = Self(named: "SFPro-DisplayThinItalic")
	static let sfDisplayUltraLight = Self(named: "SFPro-DisplayUltraLight")
	static let sfDisplayUltraLightItalic = Self(named: "SFPro-DisplayUltraLighItalic")
}
