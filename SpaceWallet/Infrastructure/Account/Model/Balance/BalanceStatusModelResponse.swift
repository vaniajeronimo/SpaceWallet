//
//  BalanceStatusModelResponse.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 20/07/2025.
//

import SwiftUI

public struct BalanceStatusModelResponse {
	public let status: BalanceStatusModel

	public init(value: Double) {
		self.status = BalanceStatusModel.from(value: value)
	}
}
