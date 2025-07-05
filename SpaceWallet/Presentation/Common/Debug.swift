//
//  Debug.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import Foundation

public enum Debug {

	public static func error(_ error: Error, _ message: String = "", file: String = #fileID, line: Int = #line) {
		debugPrint("❌ - \(message)",
				   "file: \(file)",
				   "line: \(line)",
				   "error: \(error)",
				   separator: "\n")
	}

	public static func log(_ message: String, file: String = #fileID, line: Int = #line) {
		debugPrint("ℹ️ - \(message)",
				   "file: \(file)",
				   "line: \(line)",
				   separator: "\n")
	}
}
