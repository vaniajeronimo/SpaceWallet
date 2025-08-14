//
//  SendToScreen.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 14/08/2025.
//

import SwiftUI

struct SendToScreen: View {

	@Bindable private var viewModel = ViewModel()
	@FocusState private var searchIsFocused: Bool

	@State private var showAlert: Bool = false
	@State private var showMore: Bool = false
	@State private var selectedTab: TabButton.SelectedTab = .assets

	private let onAction: (AvatarModel) -> Void

	init(onAction: @escaping (AvatarModel) -> Void) {
		self.onAction = onAction
	}

	var body: some View {
		content
	}

	private var content: some View {
		ScrollView(showsIndicators: false) {
			VStack(spacing: UI.Spacing.level03) {
				Section(header: sectionHeader(title: "recents".localized, subtitle: "show_more".localized)) {
					VStack(alignment: .leading) {
						ForEach(viewModel.recents, id: \.self) { avatar in
							AvatarCard(model: avatar, onTap: {
								onAction(avatar)
							})
						}
					}
				}

				Spacer()

				if showMore {
					Section(header: sectionHeader(title: "suggested".localized)) {
						VStack(alignment: .leading) {
							ForEach(viewModel.suggested, id: \.self) { avatar in
								AvatarCard(model: avatar, onTap: {
									onAction(avatar)
								})
							}
						}
					}
				}
			}
			.padding(.top, UI.Spacing.level07)
		}
		.padding(.horizontal, UI.Spacing.level06)
	}

	private func sectionHeader(title: String, subtitle: String? = nil) -> some View {
		HStack(alignment: .center) {
			Text(title)
				.font(.heading4SemiBold)
				.foregroundColor(Color.textPrimary)

			Spacer()

			if let subtitle {
				Text(subtitle)
					.font(.heading4SemiBold)
					.foregroundColor(showMore ? Color.violetDefault : Color.graySecondary)
					.onTapGesture {
						showMore.toggle()
					}
			}
		}
	}
}
