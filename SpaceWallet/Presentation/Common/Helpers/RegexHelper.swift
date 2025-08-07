//
//  RegexHelper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import Foundation

public enum RegexHelper {
	static let phoneNumberMask = "+XXXXXX####"
	static let phoneNumber = "^[\\d#]+$"
	static let taxNumber = #"^\d+$"#
	static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	static let profileName = "^[a-zA-ZÀ-ÿ0-9 ]*$"
	static let password = "[\\d\\p{P}\\p{S}]"
}
