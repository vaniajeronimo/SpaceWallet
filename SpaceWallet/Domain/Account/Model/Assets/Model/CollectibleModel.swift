//
//  CollectibleModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 17/07/2025.
//

import SwiftUI

public struct CollectibleModel: Hashable, Identifiable {
	public var id: Int
	public var name: String
	public var imageName: String
	public var description: String

	public var image: Image {
		Image(imageName)
	}
}
