//
//  NetworkManager.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import Foundation
import Network

public enum NetworkStatus: String {
	case connected
	case disconnected
}

public class NetworkManager: ObservableObject {

	var monitor: NWPathMonitor?

	@Published public var status: NetworkStatus = .disconnected
	@Published private var pathStatus = NWPath.Status.requiresConnection

	@Published public var isConnected = false
	@Published public var isMonitoring = false

	public init() {
		startMonitoring()
	}

	deinit {
		stopMonitoring()
	}

	public func startMonitoring() {
		guard !isMonitoring else { return }

		monitor = NWPathMonitor()
		let queue = DispatchQueue(label: "NetworkStatus_Monitor")
		monitor?.start(queue: queue)

		monitor?.pathUpdateHandler = { [weak self] path in
			guard let self else { return }

			executeInMainThread {
				let newStatus = path.status
				if self.pathStatus != newStatus {
					self.pathStatus = newStatus
					self.status = (newStatus == .satisfied) ? .connected : .disconnected
					self.isConnected = (self.status == .connected)
				}
			}
		}
		isMonitoring = true
	}

	public func stopMonitoring() {
		guard isMonitoring, let monitor else { return }
		monitor.cancel()
		self.monitor = nil
		isMonitoring = false
	}
}
