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

		public static let displayRegular = Self(SFProFont.sfDisplayRegular.name, 34.0, 41.0, 0)
		public static let displayBold = Self(SFProFont.sfBold.name, 34, 41.0, 0)
		public static let heading1 = Self(SFProFont.sfDisplayRegular.name, 28.0, 36.0, 0)
		public static let heading1Bold = Self(SFProFont.sfBold.name, 28.0, 36.0, 0)
		public static let heading2 = Self(SFProFont.sfDisplayRegular.name, 24.0, 31.0, 0)
		public static let heading2Bold = Self(SFProFont.sfBold.name, 24.0, 31.0, 0)
		public static let heading3 = Self(SFProFont.sfDisplayRegular.name, 20.0, 26.0, 0)
		public static let heading3Bold = Self(SFProFont.sfBold.name, 20.0, 26.0, 0)
		public static let heading4 = Self(SFProFont.sfDisplayRegular.name, 16.0, 21.0, 0)
		public static let heading4SemiBold = Self(SFProFont.sfDisplaySemiBold.name, 16.0, 21.0, 0)
		public static let heading5 = Self(SFProFont.sfDisplayRegular.name, 14.0, 18.0, 0)
		public static let heading5SemiBold = Self(SFProFont.sfDisplayRegular.name, 14.0, 18.0, 0)

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
