//
//  ActionCardModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftUI

struct ActionCardModel: Identifiable {
	let id = UUID()
	let icon: Image
	let title: String
	let action: () -> Void
}
