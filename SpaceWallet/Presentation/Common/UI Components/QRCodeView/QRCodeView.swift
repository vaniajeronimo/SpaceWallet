//
//  QRCodeView.swift
//  SpaceWallet
//
//  Created by Vania Jeronimo on 19/07/2025.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

public struct QRCodeView: View {
	let size: CGFloat

	private let context = CIContext()
	private let filter = CIFilter.qrCodeGenerator()

	public var body: some View {
		if let image = generateQRCodeImage() {
			Image(uiImage: image)
				.interpolation(.none)
				.resizable()
				.scaledToFit()
				.frame(width: size, height: size)
				.clipShape(RoundedRectangle(cornerRadius: UI.Corner.l))
				.overlay(
					RoundedRectangle(cornerRadius: UI.Corner.l)
						.stroke(Color.b0, lineWidth: UI.Border.l)
				)
		} else {
			Image(systemName: "xmark.octagon")
				.resizable()
				.scaledToFit()
				.frame(width: size, height: size)
				.foregroundColor(.grayQuaternary)
		}
	}

	private func generateQRCodeImage() -> UIImage? {
		let dynamicAddress = "0x" + UUID().uuidString
		let data = Data(dynamicAddress.utf8)
		filter.setValue(data, forKey: "inputMessage")

		if let outputImage = filter.outputImage {
			let transform = CGAffineTransform(scaleX: 10, y: 10)
			let scaledImage = outputImage.transformed(by: transform)

			if let cgImage = context.createCGImage(scaledImage, from: scaledImage.extent) {
				return UIImage(cgImage: cgImage)
			}
		}
		return nil
	}
}
