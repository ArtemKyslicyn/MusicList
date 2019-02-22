//
//  AlbumsResult.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 22.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

struct AlbumsResult: Codable {

	let results: [Albums]

	enum CodingKeys: String, CodingKey {
		case results
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		results = try values.decode([Albums].self, forKey: .results)
	}

	init(array: [Albums]) {
		self.results = array
	}
}
