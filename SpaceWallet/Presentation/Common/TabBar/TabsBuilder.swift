//
//  TabsBuilder.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import Foundation

@resultBuilder
public struct TabsBuilder {

	public static func buildBlock(_ components: Tab...) -> [Tab] {
		components
	}

	public static func buildEither(first component: Tab) -> Tab {
		component
	}

	public static func buildEither(second component: Tab) -> Tab {
		component
	}
}
