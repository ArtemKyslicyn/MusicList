//
//  AlbumsItem.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 19.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

/// Cell for albums
final class AlbumsCell <T>: UITableViewCell, AbstractCell where T: AlbumItemProtocol {

	 /// configure cell with template object
	 ///
	 /// - Parameter item: item for configuration
	 func configureCell(with item: T) {
		self.textLabel?.text = item.name + " - " + item.songName
		self.imageView?.image = UIImage(named: "default-album-art")
		if let imageUrl = URL(string: item.imageUrl) {
			self.imageView?.load(url: imageUrl )
		}
	}

}
