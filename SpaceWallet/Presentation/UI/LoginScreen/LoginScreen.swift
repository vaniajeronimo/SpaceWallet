//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct LoginScreen: View {

	@State private var illustrationIndex: Illustration = .first

	private var onAction: (ActionType) -> Void

	public init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		GeometryReader { proxy in
			ZStack {
				LinearGradient.violetGradient
					.ignoresSafeArea()

				VStack(spacing: 16) {
					currentIllustration
					Spacer()
					AuthCard {
						updateIllustration(for: $0)
					}
				}
				.padding(.top, proxy.safeAreaInsets.top + 16)
				.padding(.horizontal, 20)
			}
		}
	}

	@ViewBuilder
	private var currentIllustration: some View {
		Image(illustrationIndex.image)
			.resizable()
			.frame(width: 300, height: 300)
			.scaledToFit()
	}

	private func updateIllustration(for index: Int) {
		illustrationIndex = Illustration(rawValue: index) ?? .first
	}
}

public extension LoginScreen {

	enum Illustration: Int {
		case first = 0
		case second
		case third

		var image: ImageResource {
			switch self {
				case .first: return .noOrderFound
				case .second: return .emptyCart
				case .third: return .noSearchFound
			}
		}
	}

	enum ActionType {
		case next
	}
}
