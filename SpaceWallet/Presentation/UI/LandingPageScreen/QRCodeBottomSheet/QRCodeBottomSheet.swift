//
//  QRCodeBottomSheet.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import SwiftUI

struct QRCodeBottomSheet: View {

	@Environment(\.modelContext)
	private var modelContext

	@Bindable private var viewModel: ViewModel
	@Binding var isShowing: Bool

	init(isShowing: Binding<Bool>) {
		self._isShowing = isShowing
		self.viewModel = .init(isShowing: isShowing)
	}

	var body: some View {
		CustomBottomSheet(
			height: 630,
			content: {
				contentView
			}
		)
		.mainTitle("receive".localized)
		.bottomPadding(UI.Spacing.level07)
		.isShowing($viewModel.isShowing)
		.dismissKeyboard()
		.keyboardAware(offset: 60)
	}

	private var contentView: some View {
		VStack(spacing: .zero) {
			ScrollView(showsIndicators: false) {
				VStack(alignment: .center, spacing: UI.Spacing.level08) {
					QRCodeView(size: 200)
					infoText
					textField
					cta
				}
			}
			.padding(.top, UI.Spacing.level07)
		}
		.padding(.horizontal, UI.Spacing.level07)
		.onAppear {
			viewModel.setContext(modelContext)
		}
	}

	private var infoText: some View {
		HStack(alignment: .top, spacing: UI.Spacing.level04) {
			Image.stars
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 21.6, maxHeight: 21.6)

			VStack(alignment: .leading, spacing: UI.Spacing.level02) {
				Text("qrcode_bottom_sheet_title".localized)
					.font(.heading4)
					.fontWeight(.medium)
					.foregroundStyle(.b0)
				Text("qrcode_bottom_sheet_subtitle".localized)
					.font(.body)
					.fontWeight(.medium)
					.foregroundStyle(.grayTertiary)
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}

	private var textField: some View {
		CustomTextField(
			title: "amount".localized,
			text: $viewModel.amount
		)
		.state(.default)
		.showClearButton(true)
		.isNumberField(true)
		.keyboardType(.decimalPad)
		.submitLabel(.done)
	}

	private var cta: some View {
		Button {
			viewModel.updateBalance()
		} label: {
			Text("done".localized)
		}
		.buttonStyle(PrimaryButton(.large))
	}
}
