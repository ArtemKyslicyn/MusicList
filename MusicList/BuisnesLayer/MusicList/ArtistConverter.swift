//
//  ArtistConverter.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 18.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

class ArtistConverter {
	
	func convertDataToObject<T: Codable>(_ type: T.Type = T.self, data: Data) throws -> T {
		let jsonString = String(decoding: data, as: UTF8.self)
		let jsonData = jsonString.data(using: .utf8)!
		//print(jsonString)
		return try JSONDecoder().decode(T.self, from: jsonData)
	}
}
