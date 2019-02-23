//
//  Artist.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

struct Artist: Codable {

	/// artistName
	let artistName: String
	/// trackName
	let trackName: String
	/// imageUrl
	let imageUrl: String
	/// trackId
	var trackId: UInt64?
	/// artistId
	var artistId: UInt64?
	/// collectionId
	var collectionId: UInt64?

	enum CodingKeys: String, CodingKey {
		case artistName
		case imageUrl = "artworkUrl30"
		case trackName
		case trackId
		case artistId
		case collectionId
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		artistName = try values.decode(String.self, forKey: .artistName)
		trackName = try values.decode(String.self, forKey: .trackName)
		imageUrl = try values.decode(String.self, forKey: .imageUrl)
		trackId = try? values.decode(UInt64.self, forKey: .trackId)
		artistId = try? values.decode(UInt64.self, forKey: .artistId)
		collectionId = try? values.decode(UInt64.self, forKey: .collectionId)
	}

}
