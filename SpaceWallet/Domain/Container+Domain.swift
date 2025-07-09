//
//  Container+Domain.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Factory

extension Container {

	var checkIfEmailIsRegisteredUseCase: Factory<CheckIfEmailIsRegisteredUseCase> {
		self { CheckIfEmailIsRegisteredUseCase() }
	}
}
