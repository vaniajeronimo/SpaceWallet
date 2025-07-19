//
//  HomeScreenBottomSheets.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 18/07/2025.
//

import SwiftUI

extension LandingPageScreen {

	var receiveBottomSheet: some View {
		CustomBottomSheet(
			height: 650,
			content: {
				contentView
			}
		)
		.mainTitle("receive".localized)
		.isShowing($isToShowReceiveBottomSheet)
	}

	private var contentView: some View {
		VStack {
			ScrollView(showsIndicators: false) {
				VStack(alignment: .center, spacing: 32) {
					QRCodeView(size: 200)

					HStack(alignment: .top, spacing: 12) {
						Image.stars
							.resizable()
							.scaledToFit()
							.frame(maxWidth: 21.6, maxHeight: 21.6)

						VStack(alignment: .leading, spacing: 4) {
							Text("Ready to receive?")
								.font(.heading4)
								.fontWeight(.medium)
								.foregroundStyle(.b0)
							Text("Please confirm the amount that you will receive")
								.font(.body)
								.fontWeight(.medium)
								.foregroundStyle(.grayTertiary)
						}
					}
					.frame(maxWidth: .infinity, alignment: .leading)

					VStack(alignment: .center, spacing: 24) {
						CustomTextField(title: "Amount", text: .constant(""))
							.showClearButton(true)
							.keyboardType(.numberPad)
					}
				}
				.padding(.top, 32)
			}

			Button {
				print("Receive button tapped")
			} label: {
				Text("Confirm")
			}
			.buttonStyle(PrimaryButton(.large))
		}
		.padding(.horizontal, 24)
	}
}
