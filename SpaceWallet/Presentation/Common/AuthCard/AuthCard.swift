//
//  AuthCard.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import SwiftUI

public struct AuthCard: View {

	private var viewModel = ViewModel()

	public init() {}

	public var body: some View {
		content
	}

	private var content: some View {
		VStack {
			Carrousel(data: viewModel.steps)

			Button {
				print("Action")
			} label: {
				Text("continue".localized)
			}
			.buttonStyle(PrimaryButton(.medium))
			.padding(.horizontal, 24)
		}
		.cornerRadius(40)
		.background(Color.white.blur(radius: 20))
		.frame(width: 343, height: 408)
	}
}
