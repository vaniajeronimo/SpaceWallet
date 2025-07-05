//
//  SpaceWalletApp.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

public struct LoginScreen: View {

	private var viewModel: ViewModel

	public init(onAction: @escaping (ActionType) -> Void) {
		self.viewModel = .init(onAction: onAction)
	}

	public var body: some View {
		GeometryReader { proxy in
			ZStack {
				LinearGradient.violetGradient2
					.ignoresSafeArea()

				ScrollView(showsIndicators: false) {
					VStack(alignment: .center, spacing: UI.Spacing.level05) {
						currentIllustration
						AuthCard { action in
							viewModel.handleAction(with: action)
						}
					}
					.padding(.top, proxy.safeAreaInsets.top - 50)
				}
			}
			.dismissKeyboard()
		}
	}

	@ViewBuilder
	private var currentIllustration: some View {
		Image(viewModel.illustrationIndex.image)
			.resizable()
			.frame(width: 300, height: 300)
			.scaledToFit()
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
		case onContinue
	}
}
