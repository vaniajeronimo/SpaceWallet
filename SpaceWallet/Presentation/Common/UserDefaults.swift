//
//  UserDefaults.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 08/07/2025.
//

import CoreLocation
import Foundation

public extension UserDefaults {

	enum Key: String {
		case isFirstLaunch = "isFirstLaunch"
		case userEmail = "userEmail"
	}

	func register(value: Any, forKey key: Key) {
		UserDefaults.standard.register(defaults: [key.rawValue: value])
	}

	func registerDefaults() {
		register(value: true, forKey: .isFirstLaunch)
	}

	func clearDefaults(forKeys keys: [String]) {
		keys.forEach { self.removeObject(forKey: $0) }
	}
}

public extension UserDefaults {

	class var isFirstLaunch: Bool {
		get {
			return UserDefaults.standard.bool(
				forKey: Key.isFirstLaunch.rawValue
			)
		}
		set {
			UserDefaults.standard.set(
				newValue, forKey: Key.isFirstLaunch.rawValue
			)
		}
	}

	class var userEmail: String? {
		get {
			return UserDefaults.standard.object(forKey: Key.userEmail.rawValue) as? String
		}
		set {
			UserDefaults.standard.set(newValue, forKey: Key.userEmail.rawValue)
		}
	}
}
