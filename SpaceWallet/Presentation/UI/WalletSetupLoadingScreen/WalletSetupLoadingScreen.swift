//
//  WalletSetupLoadingScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 13/07/2025.
//

import SwiftUI

public struct WalletSetupLoadingScreen: View {

	@Environment(\.modelContext)
	private var modelContext

	private var viewModel: ViewModel

	public init(wallet: WalletModel, onAction: @escaping () -> Void) {
		self.viewModel = .init(wallet: wallet, onAction: onAction)
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetPrimary
				.ignoresSafeArea(edges: .all)

			ScrollView {
				content
			}
			.padding(.horizontal, UI.Spacing.level07)
		}
		.onAppear {
			viewModel.setContext(modelContext)
		}
	}

	private var content: some View {
		VStack(spacing: .zero) {
			Spacer(minLength: 104)

			Image.hourglass
				.resizable()
				.scaledToFit()
				.frame(width: 300, height: 300)

			VStack(spacing: UI.Spacing.level04) {
				Text("creating_wallet_title".localized)
					.font(.heading1Bold)
					.foregroundStyle(.textPrimary)
				Text("creating_wallet_subtitle".localized)
					.font(.body)
					.foregroundStyle(.textSecondary)
					.fontWeight(.medium)
			}
			.multilineTextAlignment(.center)
		}
	}
}
