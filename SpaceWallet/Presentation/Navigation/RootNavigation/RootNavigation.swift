//
//  RootNavigation.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import SwiftUI

struct RootNavigation: View, Navigation {

	internal var navigation = NavigationController()

	init() {
		navigation.rootView(splash)
	}

	var body: some View {
		navigation
			.ignoresSafeArea()
	}

	@ViewBuilder
	private var splash: some View {
		SplashScreen(onCompletion: { route in
			switch route {
				case .login:
					navigation.rootView(login)
				case .internetConnectionError:
					navigation.rootView(noInternetConnectionError)
				case .genericError:
					navigation.rootView(genericError)
			}
		})
	}

	@ViewBuilder
	private var login: some View {
		LoginScreenNavigation()
	}

	@ViewBuilder
	private var home: some View {
		HomeScreen { action in
			switch action {
				case .buy:
					break
				default:
					break
			}
		}
	}

	@ViewBuilder
	private var noInternetConnectionError: some View {
		ErrorScreen(
			title: "no_internet_connection_error_title".localized,
			subtitle: "no_internet_connection_error_description".localized,
			buttonTitle: "restart_app".localized,
			onAction: {
				navigation.rootView(splash)
			}
		)
	}

	@ViewBuilder
	private var genericError: some View {
		ErrorScreen(
			buttonTitle: "restart_app".localized,
			onAction: {
				navigation.rootView(splash)
			}
		)
	}
}
