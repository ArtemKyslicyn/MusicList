//
//  MusicDetailSercvice.swift
//  MusicList
//
//  Created by Artem Kislitsyn on 17.02.2019.
//  Copyright © 2019 3. All rights reserved.
//

import Foundation

typealias AlbumsSuccesBlock = ([Artist]) -> Void

protocol AbstractMusicDetailtService {

	func albumsBy(albumId: UInt64, success:@escaping ArtistSuccesBlock, errorBlock:@escaping ErrorBlock)
}

class MusicDetailService: AbstractMusicDetailtService {

	func albumsBy(albumId: UInt64, success: @escaping ([Artist]) -> Void, errorBlock: @escaping (Error) -> Void) {

		guard var components = URLComponents(string: ApiURL.search.rawValue) else {
			errorBlock(ConnError.invalidURL)
			return
		}

		let searchItem = URLQueryItem(name: idKey, value: String(albumId))
		let albumItem = URLQueryItem(name: entityKey, value: albumCategory)
		components.queryItems = [searchItem, albumItem]
		let url = components.string ?? ApiURL.lookup.rawValue

		let request = PacketRequest(path: url)
		networkDispatcher.dispatch(request: request, onSuccess: { data in
			guard let searchResult = try? self.converter.convertDataToObject(SearchResult.self, data: data) else {
				errorBlock(ConnError.cantParseData)
				return
			}
			DispatchQueue.main.async {
				success(searchResult.results)
			}
		}, onError: { error in

			DispatchQueue.main.async {
				errorBlock(error)
			}
		})
	}

	let networkDispatcher: NetworkDispatcher = URLSessionNetworkDispatcher()
	let converter = ArtistConverter()
}
