//
//  AlbumsItem.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 19.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

class AlbumsCell: UITableViewCell, AbstractCell {

	 func configureCellWithItem(item: AbstractItem) {
		if let item = item as? AlbumItem {
			self.textLabel?.text = item.name + " - " + item.songName
			self.imageView?.image = UIImage(named: "default-album-art")
			if let imageUrl = URL(string: item.imageUrl) {
				self.imageView?.load(url: imageUrl )
			}
		}
	}

}
