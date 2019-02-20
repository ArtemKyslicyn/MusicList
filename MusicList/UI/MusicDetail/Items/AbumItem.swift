//
//  AbumItem.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 19.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

class AlbumItem: TableItem {

	let name: String
	let songName: String
	let imageUrl: String

	init(name: String, songName: String, imageUrl: String, artistId: UInt64? = nil) {
		self.name = name
		self.songName = songName
		self.imageUrl = imageUrl
	}

}
