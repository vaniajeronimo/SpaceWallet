//
//  AppDelegate.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {

	@Published var notificationInfo: [AnyHashable: String] = [:]

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		FirebaseApp.configure()
		return true
	}
}
