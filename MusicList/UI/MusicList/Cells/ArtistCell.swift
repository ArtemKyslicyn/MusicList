//
//  MusicCell.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import UIKit

final class ArtistCell<T>: UITableViewCell, AbstractCell where T: ArtistItemProtocol {

	 func configureCell(with item: T) {
		self.textLabel?.text = item.name + " - " + item.songName
		self.imageView?.image = UIImage(named: "default-album-art")
		if let imageUrl = URL(string: item.imageUrl) {
			self.imageView?.load(url: imageUrl, defaultImage: UIImage(named: "default-album-art")  )
		}
	}

}
