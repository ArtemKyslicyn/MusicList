//
//  SearchResult.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 18.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

struct SearchResult : Codable{
	
	   let results:[Artist]
	
		enum CodingKeys : String, CodingKey {
			case results
		}
	
		init(from decoder:Decoder) throws {
			let values = try decoder.container(keyedBy: CodingKeys.self)
			results = try values.decode([Artist].self, forKey: .results)
		}
	
		init(array : [Artist]) {
			self.results = array
		}
}
