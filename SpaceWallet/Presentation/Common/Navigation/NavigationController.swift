//
//  NavigationController.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 01/07/2025.
//

import Combine
import SwiftUI

public struct NavigationController: UIViewControllerRepresentable {

	private let navigation = UINavigationController()
	private let currentRootViewSubject: CurrentValueSubject<(any View)?, Never> = CurrentValueSubject(nil)

	public init() {}

	public func makeUIViewController(context: Context) -> UINavigationController {
		navigation.navigationBar.isHidden = true
		return navigation
	}

	public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

	public func rootView<V: View>(_ rootView: V, animated: Bool = false) {
		let vc = UIHostingController(rootView: rootView)

		currentRootViewSubject.send(rootView)
		navigation.setViewControllers([vc], animated: animated)
		navigation.view.layoutIfNeeded()
	}

	public func push<V: View>(_ view: V, animated: Bool = true) {
		let vc = UIHostingController(rootView: view)

		navigation.pushViewController(vc, animated: animated)
	}

	public func showSheet<V: View>(_ view: V, animated: Bool = true) {
		navigation.present(UIHostingController(rootView: view), animated: animated)
	}

	public func showFullScreen<V: View>(_ view: V, animated: Bool = true, presentationStyle: UIModalPresentationStyle = .fullScreen) {
		let vc = UIHostingController(rootView: view)
		vc.modalPresentationStyle = presentationStyle

		navigation.present(vc, animated: animated)
	}

	public func popToRoot(animated: Bool = true, completion: (() -> Void)? = nil) {

		if let rootVC = navigation.presentedViewController {
			rootVC.dismiss(animated: animated) {
				navigation.popToRootViewController(animated: animated)
				completion?()
			}
		} else {
			navigation.popToRootViewController(animated: animated)
			completion?()
		}
	}

	public func popOrDismiss(animated: Bool = true) {
		if let vc = navigation.presentedViewController {
			vc.dismiss(animated: animated)
		} else {
			navigation.popViewController(animated: animated)
		}
	}

	public func currentRootView() -> AnyPublisher<(any View)?, Never> {
		currentRootViewSubject
			.eraseToAnyPublisher()
	}
}
