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
		case isFirstNotificationPermissionRequest = "isFirstNotificationPermissionRequest"
		case userEmail = "userEmail"
		case userName = "userName"
		case userPhoneNumber = "userPhoneNumber"
	}

	func register(value: Any, forKey key: Key) {
		UserDefaults.standard.register(defaults: [key.rawValue: value])
	}

	func registerDefaults() {
		register(value: true, forKey: .isFirstLaunch)
		register(value: true, forKey: .isFirstNotificationPermissionRequest)
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

	class var isFirstNotificationPermissionRequest: Bool {
		get {
			return UserDefaults.standard.bool(
				forKey: Key.isFirstNotificationPermissionRequest.rawValue
			)
		}
		set {
			UserDefaults.standard.set(
				newValue, forKey: Key.isFirstNotificationPermissionRequest.rawValue
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

	class var userName: String? {
		get {
			return UserDefaults.standard.object(forKey: Key.userName.rawValue) as? String
		}
		set {
			UserDefaults.standard.set(newValue, forKey: Key.userName.rawValue)
		}
	}

	class var userPhoneNumber: String? {
		get {
			return UserDefaults.standard.object(forKey: Key.userPhoneNumber.rawValue) as? String
		}
		set {
			UserDefaults.standard.set(newValue, forKey: Key.userPhoneNumber.rawValue)
		}
	}
}
