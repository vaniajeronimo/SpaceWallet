//
//  SelectableBottomSheet.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 10/07/2025.
//

import SwiftUI

public struct SelectableBottomSheet<T: SelectableItemProtocol>: View {

	@Bindable var viewModel: ViewModel

	private let title: String?
	private let description: String?
	private let hasSearchView: Bool
	private let isMandatory: Bool
	private let height: CGFloat?
	private let bottomPadding: CGFloat

	@Binding private var isShowing: Bool
	@Binding private var selectedItem: T?

	private var onSelectedCallback: (T) -> Void
	private var onClose: () -> Void
	private var onDidFinishSearch: (String) -> Void

	public init(
		title: String? = nil,
		description: String? = nil,
		hasSearchView: Bool = false,
		isMandatory: Bool = true,
		height: CGFloat? = nil,
		items: [T],
		selectedItem: Binding<T?>,
		bottomPadding: CGFloat = .zero,
		onSelectedCallback: @escaping (T) -> Void = { _ in },
		onDidFinishSearch: @escaping (String) -> Void = { _ in },
		onClose: @escaping () -> Void = { },
		isShowing: Binding<Bool>
	) {
		self.title = title
		self.description = description
		self.hasSearchView = hasSearchView
		self.isMandatory = isMandatory
		self.height = height
		self._selectedItem = selectedItem
		self.bottomPadding = bottomPadding
		self.onSelectedCallback = onSelectedCallback
		self.onDidFinishSearch = onDidFinishSearch
		self.onClose = onClose
		self._isShowing = isShowing
		self.viewModel = .init(items: items)
	}

	public var body: some View {
		GeometryReader { geometry in
			CustomBottomSheet(
				height: height ?? geometry.size.height,
				onDismiss: {
					onClose()
				}, content: {
					content
				},
			)
			.mainTitle(title)
			.isShowing($isShowing)
			.bottomPadding(UI.Spacing.level07)
		}
	}

	private var content: some View {
		VStack {
			ScrollView {
				VStack(spacing: UI.Spacing.level04) {
					ForEach(viewModel.items) { item in
						SelectableItemRow(
							iconName: item.iconName,
							title: item.description,
							isSelected: item == selectedItem
						) {
							selectedItem = item
						}
					}
				}
				.padding(.vertical)
			}
			.padding(.top, UI.Spacing.level05)
			cta
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}

	private var cta: some View {
		Button {
			if let selectedItem {
				onSelectedCallback(selectedItem)
			}
		} label: {
			Text("done".localized)
		}
		.buttonStyle(PrimaryButton(.large, color: .b0, titleColor: .textPrimary))
		.padding(.horizontal, UI.Spacing.level07)
		.padding(.bottom, bottomPadding)
	}
}
