//
//  AuthCard.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

public struct AuthCard: View {

	private var viewModel = ViewModel()

	private let onAction: (ActionType) -> Void

	public init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		content
	}

	private var content: some View {
		VStack(alignment: .center) {
			promotionalText
			cta
			signInText
		}
		.cornerRadius(40)
		.background(Color.white.blur(radius: 20))
		.frame(width: 343, height: 408)
	}

	private var promotionalText: some View {
		Carrousel(
			data: viewModel.steps
		) { index in
			onAction(.onNewIndex(index))
		}
		.padding(.bottom, 32)
	}

	private var cta: some View {
		Button {
			print("Action")
		} label: {
			Text("continue".localized)
		}
		.buttonStyle(PrimaryButton(.medium))
	}

	private var signInText: some View {
		HStack(alignment: .center, spacing: 4) {
			Divider().custom()

			Text("Or sign in with".localized)
				.font(.heading5)
				.foregroundStyle(.textTertiary)

			Divider().custom()
		}
		.padding(.top, 16)
	}
}

public extension AuthCard {

	enum ActionType {
		case onContinue
		case onNewIndex(Int)
	}
}
