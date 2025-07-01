//
//  ThreadHandler.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import Foundation

public typealias MethodHandler = () -> Void

/** Perform actions in main thread  */
public func executeInMainThread(_ execution: @escaping MethodHandler, after: Double = 0.0) {
	DispatchQueue.main.asyncAfter(deadline: .now() + after) {
		execution()
	}
}

/** Perform actions in background thread  */
public func executeInBackgroundThread(_ execution: @escaping MethodHandler, after: Double = 0.0) {
	DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + after) {
		execution()
	}
}
