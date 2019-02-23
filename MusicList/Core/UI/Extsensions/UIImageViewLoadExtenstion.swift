//
//  UIImageViewLoadExtenstion.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

extension UIImageView {

	/// load image by URL if error method returns default image
	///
	/// - Parameters:
	///   - url: request url
	///   - defaultImage: default image
	func load(url: URL, defaultImage: UIImage? = nil) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
				DispatchQueue.main.async {
					self?.image = image
				}
			} else {
				DispatchQueue.main.async {
					self?.image = defaultImage
				}
			}
		}
	}
}
