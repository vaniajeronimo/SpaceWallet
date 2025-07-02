//
//  FontExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

extension Font {

	public struct Style {
		public let font: Font
		public let fontName: String
		public let fontSize: CGFloat
		public let lineHeight: CGFloat
		public let letterSpacing: CGFloat

		private init(_ fontName: String, _ fontSize: CGFloat, _ lineHeight: CGFloat, _ letterSpacing: CGFloat) {
			self.font = Font.custom(fontName, fixedSize: fontSize)
			self.fontName = fontName
			self.fontSize = fontSize
			self.lineHeight = lineHeight
			self.letterSpacing = letterSpacing
		}

		public static let displayDisplayRegular = Self(SFProFont.sfDisplayRegular.name, 34.0, 41.0, 0)
		public static let displayBold = Self(SFProFont.sfBold.name, 34, 41.0, 0)

		public static let displayDisplayRegularItalic = Self(SFProFont.sfDisplayRegularItalic.name, 48, 3.6, -0.4)
		public static let displayBlack = Self(SFProFont.sfBlack.name, 56, 4.2, -0.4)
		public static let displayBlackItalic = Self(SFProFont.sfBlackItalic.name, 48, 3.6, -0.4)
		public static let displayBoldItalic = Self(SFProFont.sfBoldItalic.name, 48, 3.6, -0.4)
		public static let displayDisplayHeavy = Self(SFProFont.sfDisplayHeavy.name, 48, 3.6, -0.4)
		public static let displayDisplayHeavyItalic = Self(SFProFont.sfDisplayHeavyItalic.name, 48, 3.6, -0.4)
		public static let displayDisplayLight = Self(SFProFont.sfDisplayLight.name, 48, 3.6, -0.4)
		public static let displayDisplayLightItalic = Self(SFProFont.sfDisplayLightItalic.name, 48, 3.6, -0.4)
		public static let displayDisplayMedium = Self(SFProFont.sfDisplayMedium.name, 48, 3.6, -0.4)
		public static let displayDisplayMediumItalic = Self(SFProFont.sfDisplayMediumItalic.name, 48, 3.6, -0.4)
		public static let displayDisplaySemiBold = Self(SFProFont.sfDisplaySemiBold.name, 48, 3.6, -0.4)
		public static let displayDisplaySemiBoldItalic = Self(SFProFont.sfDisplaySemiBoldItalic.name, 48, 3.6, -0.4)
		public static let displayDisplayThin = Self(SFProFont.sfDisplayThin.name, 48, 3.6, -0.4)
		public static let displayDisplayThinItalic = Self(SFProFont.sfDisplayThinItalic.name, 48, 3.6, -0.4)
		public static let displayDisplayUltraLight = Self(SFProFont.sfDisplayUltraLight.name, 48, 3.6, -0.4)
		public static let displayDisplayUltraLightItalic = Self(SFProFont.sfDisplayUltraLightItalic.name, 48, 3.6, -0.4)

		func dynamicFontSize(for category: ContentSizeCategory) -> CGFloat {
			let font = UIFont(name: fontName, size: fontSize)
			guard let font else { return 0.0 }
			return font.pointSize
		}
	}
}

extension Font {
	// swiftlint: disable legacy_objc_type
	static func registerFont(named name: String) {
		guard let asset = NSDataAsset(name: name, bundle: Bundle.main),
			  let provider = CGDataProvider(data: asset.data as NSData),
			  let font = CGFont(provider),
			  CTFontManagerRegisterGraphicsFont(font, nil) else {
			return
		}
	}
	// swiftlint: enable legacy_objc_type
}
