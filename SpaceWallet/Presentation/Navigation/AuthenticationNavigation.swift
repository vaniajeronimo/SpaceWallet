//
//  AuthenticationNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 08/07/2025.
//

import SwiftUI

struct VerificationCodeNavigation: View, Navigation {

	internal var navigation = NavigationController()

	private let onDismiss: () -> Void

	init(onDismiss: @escaping () -> Void) {
		self.onDismiss = onDismiss
		navigation.rootView(verificationCode)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	@ViewBuilder
	private var verificationCode: some View {
		VStack {
			VerificationCodeScreen { action in
				switch action {
					case .onBack:
						onDismiss()
					case .onContinue:
						navigation.rootView(home)
				}
			}
		}
	}

	@ViewBuilder
	private var home: some View {
		HomeScreen { action in
			Debug.log("Home action: \(action)")
		}
	}
}
