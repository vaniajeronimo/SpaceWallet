//
//  DeviceSettingsHelper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 22/07/2025.
//

import Foundation
import UIKit

public struct DeviceSettingsHelper {
	public static func openDeviceSettings() {
		if let url = URL(string: UIApplication.openSettingsURLString) {
			if UIApplication.shared.canOpenURL(url) {
				UIApplication.shared.open(url, options: [:], completionHandler: nil)
			}
		}
	}
}
