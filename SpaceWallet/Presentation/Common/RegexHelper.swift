//
//  RegexHelper.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import Foundation

public enum RegexHelper {

	public static let phoneNumberMask = "+XXXXXX####"
	public static let phoneNumber = "^[\\d#]+$"
	public static let taxNumber = #"^\d+$"#
	public static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
	public static let profileName = "^[a-zA-ZÀ-ÿ0-9 ]*$"
	public static let password = "[\\d\\p{P}\\p{S}]"
}
