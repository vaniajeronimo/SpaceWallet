//
//  HomeScreenBottomSheets.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 18/07/2025.
//

import SwiftUI

extension LandingPageScreen {

	var receiveBottomSheet: some View {
		QRCodeBottomSheet(isShowing: $isToShowReceiveBottomSheet)
	}
}
