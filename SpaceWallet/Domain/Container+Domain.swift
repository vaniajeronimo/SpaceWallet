//
//  Container+Domain.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Factory

extension Container {

	var checkFirstLaunchUseCase: Factory<CheckFirstLaunchUseCase> {
		self { CheckFirstLaunchUseCase() }
	}

	var saveAccountUseCase: Factory<SaveAccountUseCase> {
		self { SaveAccountUseCase() }
	}

	var updateBalanceUseCase: Factory<UpdateBalanceUseCase> {
		self { UpdateBalanceUseCase() }
	}

	var getAccountUseCase: Factory<GetAccountUseCase> {
		self { GetAccountUseCase() }
	}
}
