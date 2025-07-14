//
//  WalletSetupCompletedScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/07/2025.
//

import SwiftData
import SwiftUI

public struct WalletSetupCompletedScreen: View {

	@Environment(\.modelContext)
	private var modelContext

	private var viewModel = ViewModel()

	private let onAction: () -> Void

	public init(onAction: @escaping () -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetPrimary
				.ignoresSafeArea(edges: .all)

			VStack(spacing: 16) {
				ScrollView(.vertical, showsIndicators: false) {
					content
				}
				walletCard
				cta
			}
			.padding(.horizontal, UI.Spacing.level07)
		}
		.onAppear {
			viewModel.setContext(modelContext)
		}
	}

	private var content: some View {
		VStack(alignment: .center, spacing: UI.Spacing.level04) {
			Text("wallet_ready_title".localized)
			Text("wallet_ready_subtitle".localized)

			Spacer(minLength: 40)

			Image.wallet_violet_stroke
				.resizable()
				.scaledToFit()
				.frame(width: 335, height: 244)
		}
		.font(.heading2Bold)
		.foregroundStyle(.textPrimary)
		.multilineTextAlignment(.center)
		.padding(.top, UI.Spacing.level12)
	}

	private var walletCard: some View {
		HStack(alignment: .top, spacing: 12) {
			Image.wallet_icon
				.resizable()
				.scaledToFit()
				.frame(width: 20, height: 20)

			VStack(alignment: .leading, spacing: UI.Spacing.level02) {
				Text("wallet_card_title".localized)
					.font(.heading4SemiBold)
					.foregroundStyle(.textPrimary)
				Text("wallet_card_subtitle".localized)
					.font(.footnote)
					.fontWeight(.medium)
					.foregroundStyle(.textSecondary)
			}
		}
		.frame(height: 69)
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.horizontal, UI.Spacing.level05)
		.background(Color.fillQuaternary)
		.contentShape(Rectangle())
		.cornerRadius(UI.Corner.l)
	}

	private var cta: some View {
		Button {
			viewModel.saveAccount()
		} label: {
			Text("view_wallet".localized)
		}
		.buttonStyle(PrimaryButton(.large))
		.padding(.bottom, UI.Spacing.level06)
	}
}
