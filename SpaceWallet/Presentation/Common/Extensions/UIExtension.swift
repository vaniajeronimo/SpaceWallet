//
//  UIExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 04/07/2025.
//

import Foundation
import SwiftUI

public struct UI { }

public extension UI {

	struct Spacing {
		private init() {}

		public static let level01: CGFloat = 2
		public static let level02: CGFloat = 4
		public static let level03: CGFloat = 8
		public static let level04: CGFloat = 12
		public static let level05: CGFloat = 16
		public static let level06: CGFloat = 20
		public static let level07: CGFloat = 24
		public static let level08: CGFloat = 32
		public static let level09: CGFloat = 40
		public static let level10: CGFloat = 48
		public static let level11: CGFloat = 56
		public static let level12: CGFloat = 64
		public static let level13: CGFloat = 72
		public static let level14: CGFloat = 80
		public static let level15: CGFloat = 96
		public static let level16: CGFloat = 112
		public static let level17: CGFloat = 128
		public static let level18: CGFloat = 160
		public static let level19: CGFloat = 176
		public static let level20: CGFloat = 192
	}

	struct Corner {
		private init() {}

		public static let xxs: CGFloat = 2
		public static let xs: CGFloat = 4
		public static let s: CGFloat = 8
		public static let m: CGFloat = 12
		public static let l: CGFloat = 16
		public static let xl: CGFloat = 24
		public static let xxl: CGFloat = 32
	}

	struct Border {
		private init() {}

		public static let xxl: CGFloat = 3
		public static let xl: CGFloat = 2.5
		public static let l: CGFloat = 2
		public static let m: CGFloat = 1.5
		public static let s: CGFloat = 1
	}
}
