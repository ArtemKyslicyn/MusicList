//
//  ArtistConverter.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 18.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

class ArtistConverter{
	
	func convertDataToObjects(data:Data) -> [Artist] {
		let jsonString = String(decoding: data, as: UTF8.self)
		let jsonData = jsonString.data(using: .utf8)!
		print(jsonString)
		let decoder = JSONDecoder()
		let result = try! decoder.decode(SearchResult.self, from: jsonData)
		return result.results
	}
}
