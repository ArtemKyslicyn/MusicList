//
//  ArtistItem.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

/// ArtistItemProtocol
protocol ArtistItemProtocol: Any {
	var name: String { get }
	var songName: String { get }
	var imageUrl: String { get }
	var artistId: UInt64? { get }
}

/// Artist Item Implemetation
struct ArtistItem: ArtistItemProtocol {
	let name: String
	let songName: String
	let imageUrl: String
	let artistId: UInt64?

	init(name: String, songName: String, imageUrl: String, artistId: UInt64? = nil) {
		self.name = name
		self.songName = songName
		self.imageUrl = imageUrl
		self.artistId = artistId
	}

}
