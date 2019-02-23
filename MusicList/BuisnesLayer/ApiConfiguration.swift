//
//  ApiConfiguration.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 18.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

//https://itunes.apple.com/search?term=jack+johnson
//https://itunes.apple.com/lookup?id=909253&entity=album

/// Api URL fo iTunes
///
/// - search: point of search
/// - lookup: point lookup
public enum ApiURL: String {
	case search = "https://itunes.apple.com/search"
	case lookup = "https://itunes.apple.com/lookup"
}

/// api key for requests
public struct ApiKeys {
	static let termKey = "term"
	static let idKey = "id"
	static let entityKey = "entity"
	static let albumCategory = "album"
}
