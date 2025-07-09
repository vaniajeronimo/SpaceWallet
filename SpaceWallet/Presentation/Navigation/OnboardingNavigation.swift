//
//  OnboardingNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 09/07/2025.
//

import Foundation
import SwiftUI

struct OnboardingNavigation: View, Navigation {

	internal var navigation = NavigationController()

	init() {
		navigation.rootView(createPassword)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	@ViewBuilder
	private var createPassword: some View {
		CreatePasswordScreen {
			print("continue")
		}
	}
}
