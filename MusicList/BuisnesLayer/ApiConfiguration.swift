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

public enum ApiURL : String {
	case search = "https://itunes.apple.com/search"
	case lookup = "https://itunes.apple.com/lookup"
}

let termKey = "term"
let idKey = "id"
let entityKey = "entity"
let albumCategory = "album"
