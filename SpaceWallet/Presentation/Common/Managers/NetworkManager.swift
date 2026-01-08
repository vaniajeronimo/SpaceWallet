//
//  NetworkManager.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 05/07/2025.
//

import Combine
import Network

public enum NetworkStatus: String {
	case connected
	case disconnected
}

@MainActor
public class NetworkManager: ObservableObject {

	var monitor: NWPathMonitor?
    private let queue = DispatchQueue(label: "NetworkStatus_Monitor")

	@Published public var status: NetworkStatus = .disconnected
	@Published private var pathStatus = NWPath.Status.requiresConnection

	@Published public var isConnected = false
	@Published public var isMonitoring = false

	public init() {
		startMonitoring()
	}

    deinit {
        Task { @MainActor [weak self] in
            self?.stopMonitoring()
        }
    }

    public func startMonitoring() {
        guard !isMonitoring else { return }

        monitor = NWPathMonitor()

        monitor?.pathUpdateHandler = { [weak self] path in
            guard let self else { return }

            Task { @MainActor in
                let newStatus = (path.status == .satisfied) ? NetworkStatus.connected : NetworkStatus.disconnected
                if self.status != newStatus {
                    self.status = newStatus
                    self.isConnected = (newStatus == .connected)
                }
            }
        }
        monitor?.start(queue: queue)
        isMonitoring = true
    }

    public func stopMonitoring() {
        guard isMonitoring, let monitor else { return }
        monitor.cancel()
        self.monitor = nil
        isMonitoring = false
    }

    public var isConnectedStream: AsyncPublisher<Published<Bool>.Publisher> {
        $isConnected.values
    }
}
