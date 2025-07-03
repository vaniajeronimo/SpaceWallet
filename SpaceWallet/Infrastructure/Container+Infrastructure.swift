//
//  Container+Infrastructure.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Factory

// MARK: - Auth
extension Container {

	var authRepository: Factory<IAuthRepository> {
		self { AuthRepository() }
	}
}
