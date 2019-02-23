//
//  Albums.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 22.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

/// Model albums
struct Albums: Codable {

	/// artistName
	let artistName: String?

	/// collectionName - name of collection
	let collectionName: String?

	/// imageUrl - image of album
	let imageUrl: String?

	enum CodingKeys: String, CodingKey {
		case artistName
		case imageUrl = "artworkUrl60"
		case collectionName
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		artistName = try? values.decode(String.self, forKey: .artistName)
		collectionName = try? values.decode(String.self, forKey: .collectionName)
		imageUrl = try? values.decode(String.self, forKey: .imageUrl)
	}

}
