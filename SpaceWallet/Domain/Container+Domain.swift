//
//  Container+Domain.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Factory

extension Container {

	var checkAuthStateUseCase: Factory<CheckAuthStateUseCase> {
		self { CheckAuthStateUseCase() }
	}
}
