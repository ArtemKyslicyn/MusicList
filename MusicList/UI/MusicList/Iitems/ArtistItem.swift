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
	/// name - name of Artis
	var name: String { get }
	/// songName - name of song
	var songName: String { get }
	/// imageUrl - image Url link
	var imageUrl: String { get }
	/// artistId - id artist
	var artistId: UInt64? { get }
}

/// Artist Item Implemetation
struct ArtistItem: ArtistItemProtocol {
	let name: String
	let songName: String
	let imageUrl: String
	let artistId: UInt64?

	/// Description
	///
	/// - Parameters:
	///   - name: name
	///   - songName: song name
	///   - imageUrl: image Url
	///   - artistId: artist id
	init(name: String, songName: String, imageUrl: String, artistId: UInt64? = nil) {
		self.name = name
		self.songName = songName
		self.imageUrl = imageUrl
		self.artistId = artistId
	}

}
