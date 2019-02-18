//
//  Artist.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

struct Artist : Codable{
	
	let artistName:String
	let trackName: String
	let imageUrl:String
	var trackId:UInt64?
	var artistId:UInt64?
	var collectionId:UInt64?
	
//	init(artistName:String, trackName:String, imageUrl:String) {
//		self.artistName = artistName
//		self.trackName = trackName
//		self.imageUrl = imageUrl
//	}
	enum CodingKeys : String, CodingKey {
		case artistName
		case imageUrl = "artworkUrl30"
		case trackName
		case trackId
		case artistId
		case collectionId
	}

	init(from decoder:Decoder) throws {
		//let values = try decoder.container(keyedBy: CodingKeys.self)
		//array = try values.decode([Point].self, forKey: .array)
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		artistName = try values.decode(String.self, forKey: .artistName)
		trackName  = try values.decode(String.self, forKey: .trackName)
		imageUrl  = try values.decode(String.self, forKey: .imageUrl)
		do{
			trackId  = try values.decode(UInt64?.self, forKey: .trackId)
			artistId  = try values.decode(UInt64?.self, forKey: .artistId)
			collectionId = try! values.decode(UInt64?.self, forKey: .collectionId) ?? nil
		}catch{
			
		}
		
	}
//		let height = try values.decode(Double.self, forKey: .height)
//		size = Size(width: width, height: height)
//
//	init(array : [A]) {
//		self.array = array
//	}
}
