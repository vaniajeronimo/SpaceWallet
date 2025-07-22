//
//  NotificationsManager.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 22/07/2025.
//

import Combine
import UIKit
import UserNotifications

public struct NotificationsManager {

	public static let shared = Self()
	private let center = UNUserNotificationCenter.current()

	private init() {}

	public func showLocalNotification(
		title: String,
		body: String,
		userInfo: [String: Any],
		sound: UNNotificationSound = .default,
		trigger: UNTimeIntervalNotificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false),
		identifier: String = UUID().uuidString
	) {
		let content = UNMutableNotificationContent()
		content.title = title
		content.body = body
		content.sound = sound
		content.userInfo = userInfo

		let trigger = trigger.timeInterval > 0 ? trigger : UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
		let identifier = identifier
		let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

		center.add(request) { error in
			if let error {
				Debug.error(error)
			}
		}
	}

	public func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> Void) {
		/** Request user authorization for local notifications */
		center.requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
			if let error {
				print("Request Authorization Failed (\(error), \(error.localizedDescription))")
			}
			completionHandler(success)
		}

		executeInMainThread {
			UIApplication.shared.registerForRemoteNotifications()
		}
	}

	public func registerLocalNotifications(completionHandler: @escaping (Bool) -> Void) {
		center.getNotificationSettings { notificationSettings in
			switch notificationSettings.authorizationStatus {
				case .notDetermined:
					requestAuthorization(completionHandler: { success in
						completionHandler(success)
					})
				case .authorized:
					completionHandler(true)
				case .denied, .provisional, .ephemeral:
					debugPrint("Application Not Allowed to Display Notifications")
					completionHandler(false)
				@unknown default:
					completionHandler(false)
			}
		}
	}
}
