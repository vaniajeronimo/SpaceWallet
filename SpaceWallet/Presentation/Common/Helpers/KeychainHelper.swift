//
//  KeychainHelper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 07/08/2025.
//

import Foundation

public final class KeychainHelper {

	public static let shared = KeychainHelper()
	private init() {}

	public func save(_ data: Data, tag: String) {

		let query: [CFString: Any] = [
			kSecValueData: data,
			kSecAttrApplicationTag: tag,
			kSecAttrApplicationLabel: bundleId,
			kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock,
			kSecClass: kSecClassKey
		]

		// Add data in query to keychain
		let status = SecItemAdd(query as CFDictionary, nil)

		if status == errSecDuplicateItem {

			// Item already exist, thus update it.
			let query: [CFString: Any] = [
				kSecAttrApplicationTag: tag,
				kSecAttrApplicationLabel: bundleId,
				kSecClass: kSecClassKey
			]

			let attributesToUpdate = [kSecValueData: data, kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock] as CFDictionary

			// Update existing item
			SecItemUpdate(query as CFDictionary, attributesToUpdate)
		}
	}

	public func read(tag: String) -> Data? {

		let query: [CFString: Any] = [
			kSecAttrApplicationTag: tag,
			kSecAttrApplicationLabel: bundleId,
			kSecClass: kSecClassKey,
			kSecReturnData: true
		]

		var result: AnyObject?
		SecItemCopyMatching(query as CFDictionary, &result)

		return (result as? Data)
	}

	public func delete(tag: String) {

		let query: [CFString: Any] = [
			kSecAttrApplicationTag: tag,
			kSecAttrApplicationLabel: bundleId,
			kSecClass: kSecClassKey
		]

		// Delete item from keychain
		SecItemDelete(query as CFDictionary)
	}

	private var bundleId: String {
		Bundle.main.bundleIdentifier ?? "space-crypto.SpaceWallet"
	}
}

extension KeychainHelper {

	public func save<T>(_ item: T, tag: String) where T: Codable {

		do {
			// Encode as JSON data and save in keychain
			let data = try JSONEncoder().encode(item)
			save(data, tag: tag)
		} catch {
			assertionFailure("Fail to encode item for keychain: \(error)")
		}
	}

	public func read<T>(tag: String) -> T? where T: Codable {

		// Read item data from keychain
		guard let data = read(tag: tag) else {
			return nil
		}

		// Decode JSON data to object
		do {
			let item = try JSONDecoder().decode(T.self, from: data)
			return item
		} catch {
			Debug.error(error, "Fail to decode item for keychain")
			return nil
		}
	}
}
