//
//  TabView.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 02/07/2025.
//

import SwiftUI
import Foundation

public struct TabBar: View {

	private var bgColor = Color.background_0

	private var content: [Tab]
	@Binding private var selection: TabBarItem
	@State private var tabs: [TabBarItem]

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
		.ignoresSafeArea(edges: .bottom)
		.frame(maxWidth: .infinity)
	}

	private func tabButton(tab: TabBarItem) -> some View {
		VStack(spacing: 7) {
			let isSelected = selection == tab
			let iconImage = isSelected ? tab.selectedIcon : tab.unselectedIcon
			iconImage?
				.resizable()
				.scaledToFit()
				.frame(width: 67, height: 44)
				.animation(nil, value: selection)
		}
		.ignoresSafeArea(edges: .bottom)
		.padding(.bottom, 44)
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
	}
}
