//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct SplashScreen: View {

	private var viewModel: ViewModel

	public init(onCompletion: @escaping (SplashScreenRoute) -> Void) {
		self.viewModel = .init(onCompletion: onCompletion)
	}

	public var body: some View {
		ZStack {
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
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(
			LinearGradient.violetPrimary
				.ignoresSafeArea(.all)
		)
	}
}

extension SplashScreen {

	public enum SplashScreenRoute {
		case login
		case internetConnectionError
		case genericError
	}
}
