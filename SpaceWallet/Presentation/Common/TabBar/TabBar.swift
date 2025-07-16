//
//  TabView.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI

public struct TabBar: View {

	private var bgColor = Color.background_0

	private var content: [Tab]
	@Binding private var selection: TabBarItem
	@State private var tabs: [TabBarItem]

	private var safeAreaBottomInset: CGFloat {
		UIApplication.shared.connectedScenes
			.compactMap { ($0 as? UIWindowScene)?.keyWindow }
			.first?
			.safeAreaInsets.bottom ?? 0
	}

	public init(selection: Binding<TabBarItem>, @TabsBuilder content: () -> [Tab]) {
		self._selection = selection
		self.content = content()
		self._tabs = State(initialValue: self.content.map({ $0.tag }))
		UITabBar.appearance().isHidden = true
	}

	public var body: some View {
		ZStack(alignment: .bottom) {
			TabView(selection: $selection) {
				ForEach(content) { content in
					content.content
						.edgesIgnoringSafeArea(.bottom)
						.tag(content.tag)
						.eraseToAnyView()
				}
			}
			tabBarItems()
		}
		.onAppear {
			UITabBar.appearance().isHidden = true
		}
	}

	private func tabBarItems() -> some View {
		VStack(spacing: .zero) {
			HStack(alignment: .bottom, spacing: 10) {
				ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
					Button {
						if selection == tab, let navigation = content[safe: index]?.content as? Navigation {
							navigation.navigation.popToRoot()
						}
						selection = tab
					} label: {
						tabButton(tab: tab)
					}
					.buttonStyle(PlainButtonStyle())
				}
			}
			.padding(.horizontal, UI.Spacing.level06)
		}
		.frame(maxWidth: .infinity, maxHeight: 30)
		.padding(.bottom, safeAreaBottomInset)
		.background(tabBarBackground)
		.edgesIgnoringSafeArea(.bottom)
	}

	private var tabBarBackground: some View {
		Rectangle()
			.fill(Color.white.opacity(0.05))
			.background(.ultraThinMaterial)
			.overlay(
				Rectangle()
					.stroke(Color.white, lineWidth: 1)
			)
			.edgesIgnoringSafeArea(.bottom)
	}

	private func tabButton(tab: TabBarItem) -> some View {
		VStack(spacing: 4) {
			let isSelected = selection == tab
			let iconImage = isSelected
			? tab.selectedIcon?.renderingMode(.original)
			: tab.unselectedIcon?.renderingMode(.template)

			iconImage?
				.resizable()
				.scaledToFit()
				.frame(width: 67, height: 44)
				.animation(nil, value: selection)
				.if(!isSelected) { unselectedIcon in
					unselectedIcon.foregroundStyle(.grayPrimary)
				}
		}
		.padding(.top, 44)
		.frame(maxWidth: .infinity)
	}
}
