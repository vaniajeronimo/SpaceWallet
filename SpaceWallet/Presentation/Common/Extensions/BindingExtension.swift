//
//  BindingExtension.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 29/07/2025.
//

import SwiftUI

public extension Binding {

	static func variable(_ value: Value) -> Binding<Value> {
		var state = value

		return Binding<Value> {
			state
		} set: {
			state = $0
		}
	}
}
