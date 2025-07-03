//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct LoginScreen: View {

	private var onAction: (ActionType) -> Void

	public init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetGradient

			Image.noOrderFound
				.frame(width: 300, height: 300)
				.scaledToFit()
				.padding(.top, 17)

			Spacer()
		}
		.ignoresSafeArea(edges: .all)
	}
}

public extension LoginScreen {

	enum ActionType {
		case next
	}
}
