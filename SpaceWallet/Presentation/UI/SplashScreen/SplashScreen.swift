//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct SplashScreen: View {

	private var onCompletion: () -> Void

	public init(onCompletion: @escaping () -> Void) {
		self.onCompletion = onCompletion
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetGradient

			VStack {
				Spacer()
				HStack(alignment: .top) {
					Image.star
						.frame(width: 20, height: 20)
						.scaledToFill()
					Image.planet
						.frame(width: 100, height: 100)
						.scaledToFit()
				}
				Spacer()
			}
		}
		.ignoresSafeArea(edges: .all)
	}
}
