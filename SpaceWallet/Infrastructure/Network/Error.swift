//
//  NetworkError.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 08/01/2026.
//

import Foundation

enum AccountError: LocalizedError {
    case notFound

    var errorDescription: String? {
        switch self {
            case .notFound:
                return "Account not found."
        }
    }
}
