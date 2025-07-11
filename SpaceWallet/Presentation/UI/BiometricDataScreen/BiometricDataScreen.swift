//
//  BiometricDataScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

public struct BiometricDataScreen: View {

	@Bindable private var viewModel = ViewModel()

	@State private var isOn: Bool = false

	private let onAction: (ActionType) -> Void

	public init(onAction: @escaping (ActionType) -> Void) {
		self.onAction = onAction
	}

	public var body: some View {
		ZStack {
			LinearGradient.violetPrimary
				.ignoresSafeArea(edges: .all)

			VStack(spacing: UI.Spacing.level05) {
				navBar
				ScrollView {
					content
					biometricCard
				}
				cta
			}
			.padding(.horizontal, UI.Spacing.level07)
		}
		.alert("generic_alert_title".localized, isPresented: $viewModel.isToShowAlert) {
			Button("ok".localized, role: .cancel) {
				viewModel.isToShowAlert = false
			}
		}
	}

	private var navBar: some View {
		HStack(alignment: .center) {
			Button {
				onAction(.back)
			} label: {
				Image.close_dark
					.resizable()
					.scaledToFit()
					.frame(width: 24, height: 24)
			}

			Spacer()

			Button {
				print("question mark tapped")
			} label: {
				Image.info
					.resizable()
					.scaledToFit()
					.frame(width: 24, height: 24)
			}
		}
	}

	private var content: some View {
		VStack(alignment: .center, spacing: .zero) {
			Image.secure_shield
				.resizable()
				.scaledToFit()
				.frame(width: 300, height: 300)

			VStack(spacing: UI.Spacing.level04) {
				Text("protect_your_wallet_title" .localized)
					.font(.heading1Bold)
					.foregroundStyle(.textPrimary)
				Text("protect_your_wallet_subtitle" .localized)
					.font(.body)
					.fontWeight(.medium)
					.foregroundStyle(.textSecondary)
			}
			.multilineTextAlignment(.center)
		}
	}

	private var biometricCard: some View {
		HStack(alignment: .center, spacing: UI.Spacing.level05) {
			Image.face_id
				.resizable()
				.scaledToFit()
				.frame(width: 24, height: 24)

			HStack(alignment: .top) {
				VStack(alignment: .leading, spacing: UI.Spacing.level02) {
					Text("face_id_title".localized)
						.font(.heading4)
						.fontWeight(.medium)
						.foregroundStyle(.textPrimary)
					Text("face_id_subtitle".localized)
						.font(.body)
						.fontWeight(.medium)
						.foregroundStyle(.graySecondary)
				}

				Toggle("", isOn: $isOn)
					.labelsHidden()
					.scaleEffect(0.8)
					.tint(.violetHover)
					.onChange(of: isOn) { _, newValue in
						if newValue {
							viewModel.authenticate()
						}
					}
			}
		}
		.frame(height: 77)
		.frame(maxWidth: .infinity)
		.background(Color.b0)
		.contentShape(Rectangle())
		.cornerRadius(UI.Corner.l)
		.padding(.top, UI.Spacing.level06)
	}

	private var cta: some View {
		Button {
			onAction(.next)
		} label: {
			Text("next".localized)
		}
		.buttonStyle(PrimaryButton(.large))
		.padding(.bottom, UI.Spacing.level06)
	}
}

public extension BiometricDataScreen {

	enum ActionType {
		case next
		case back
	}
}
