//
//  WalletSettingsModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 24/07/2025.
//

import SwiftUI

struct WalletSettingsModel: Identifiable {
	let id: Int
	let mainTitle: String
	let image: Image
	let title: String
	let subtitle: String
	let action: () -> Void
}
