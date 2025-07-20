//
//  QRCodeBottomSheet.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import SwiftUI

struct QRCodeBottomSheet: View {

	@Bindable private var viewModel = ViewModel()
	@Binding var isShowing: Bool

	var body: some View {
		CustomBottomSheet(
			height: 630,
			content: {
				contentView
			}
		)
		.mainTitle("receive".localized)
		.isShowing($isShowing)
	}

	private var contentView: some View {
		VStack {
			ScrollView(showsIndicators: false) {
				VStack(alignment: .center, spacing: UI.Spacing.level08) {
					QRCodeView(size: 200)

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

					VStack(alignment: .center, spacing: UI.Spacing.level07) {
						CustomTextField(
							title: "amount".localized,
							text: $viewModel.amount
						)
						.showClearButton(true)
						.isNumberField(true)
						.submitLabel(.done)
						.onSubmit {
							print("Amount submitted: \(viewModel.amount)")
						}
					}
				}
				.padding(.top, UI.Spacing.level08)
			}

			Button {
				print("Receive button tapped with amount \(viewModel.amount)")
			} label: {
				Text("done".localized)
			}
			.buttonStyle(PrimaryButton(.large))
		}
		.padding(.horizontal, UI.Spacing.level07)
	}
}
