//
//  Container+Domain.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Factory

extension Container {

	var checkFirstLaunchUseCase: Factory<CheckFirstLaunchUseCase> {
		self { @NetworkActor in CheckFirstLaunchUseCase() }
	}

	var setSessionUseCase: Factory<SetSessionUseCase> {
		self { @NetworkActor in SetSessionUseCase() }
	}
}

extension Container {

	var saveAccountUseCase: Factory<SaveAccountUseCase> {
        self { @MainActor in SaveAccountUseCase() }
	}

	var updateBalanceUseCase: Factory<UpdateBalanceUseCase> {
		self { @MainActor in UpdateBalanceUseCase() }
	}

	var updateCurencyUseCase: Factory<UpdateCurrencyUseCase> {
		self { @MainActor in UpdateCurrencyUseCase() }
	}

	var getAccountUseCase: Factory<GetAccountUseCase> {
		self { @MainActor in GetAccountUseCase() }
	}
}
