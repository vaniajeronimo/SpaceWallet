//
//  Container+Infrastructure.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 03/07/2025.
//

import Factory

// MARK: - Authentication
extension Container {

	var authenticationRepository: Factory<IAuthenticationRepository> {
		self { AuthenticationRepository() }
	}

	var authenticationDatabaseProvider: Factory<IAuthenticationDatabaseProvider> {
		self { AuthenticationDatabaseProvider() }
	}
}

extension Container {

	var accountRepository: Factory<IAccountRepository> {
		self { AccountRepository() }
	}

	var accountDao: Factory<AccountDao> {
		self { AccountDao() }
	}

	var accountDatabaseProvider: Factory<IAccountDatabaseProvider> {
		self { AccountDatabaseProvider() }
	}
}
