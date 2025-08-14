//
//  SendToScreenViewModel.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/08/2025.
//

import Foundation

extension SendToScreen {
	@Observable
	@MainActor
	final class ViewModel {

		var recents: [AvatarModel] = []
		var suggested: [AvatarModel] = []

		init() {
			recents = [
				AvatarModel(id: 0, iconName: "avatar_4", name: "Jailyn Crona", transactions: "2 Previous Transactions"),
				AvatarModel(id: 1, iconName: "avatar_3", name: "Dejah Roberts", transactions: "2 Previous Transactions"),
				AvatarModel(id: 2, iconName: "avatar_2", name: "Smith", transactions: "2 Previous Transactions"),
				AvatarModel(id: 3, iconName: "avatar_1", name: "Runolfsson", transactions: "2 Previous Transactions")
			]

			suggested = [
				AvatarModel(id: 0, iconName: "avatar_5", name: "0x36b9204a...5e23", transactions: "2 Previous Transactions"),
				AvatarModel(id: 1, iconName: "avatar_6", name: "0x35b9304a...5e24", transactions: "1 Previous Transactions"),
				AvatarModel(id: 2, iconName: "avatar_7", name: "0x01a9214b...5e42", transactions: "4 Previous Transactions")
			]
		}
	}
}
